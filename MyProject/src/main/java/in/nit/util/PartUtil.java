package in.nit.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Component;

@Component
public class PartUtil {
	public void generatePie(String path, List<Object[]>data) {
		//1.Create dataset
		DefaultPieDataset dataset = new DefaultPieDataset();
		for(Object[] arr:data) {
			//key-shipMode,val-count
			dataset.setValue(arr[0].toString(), Double.valueOf(arr[1].toString()));
		}
		//2.Create JFree using ChartFactory
		JFreeChart chart = ChartFactory.createPieChart3D("Part  Mode", dataset,true,true,false);
		//3.save as Image using chartutils
		try {
			ChartUtils.saveChartAsJPEG(new File(path +"/resources/images/partA.jpg"), chart, 400, 400);
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void generateBar(String path,List<Object[]>data) {
		//create Dataset
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for(Object[]arr:data) {
			//val-index-1(y-axis),key-index-0(x-axis)
			dataset.setValue(Double.valueOf(arr[1].toString()), arr[0].toString(),"");
		}
		//Create JFree using ChartFactory
		JFreeChart chart =ChartFactory.createBarChart("Part Mode", "Modes", "COUNT", dataset);
		//3.save as Image using chartutil
		try {
			ChartUtils.saveChartAsJPEG(new File(path +"/resources/images/partB.jpg"), chart, 400, 400);
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
