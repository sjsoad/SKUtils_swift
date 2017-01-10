# SKUtils swift

ToDo:

High priority:
- SKDatePickerTextField

Minor priority:
- ImageViewer

Bonus:
- GitHub Simple app

**DataSource**

----------

This folder contains files that will help you in work with    UITableView, UICollectionView with NSArray or    NSFetchedResultsController. 	How to use:
	- "Required" folder contains main files that describes abstract
       methods of data source, protocol for cell and data source section
       model.
	 - Also you need FRCDataSource.swift and/or ArrayDataSource.swift.
       Depends from data source that you need to implement.
	 - "CollectionView" and "TableView" folder contains each type of data    source with default implementation.
	 - Additional folder "View+DataSource" contains protocols that should be implemented by UIView/UIViewController in order to use data sources.


----------


**Example of implementation**

 - View/ViewController class

        class SomeView: UIView, ArrayTableViewProtocol { 
        	arrayDataVM: ViewModelType? {} 
        }

 - ViewModel class

        class SomeViewModel: ArrayTableViewModelProtocol {
         	typealias CellType = SomeCell
         	var arrayDataSource: TableViewArrayDataSource?
         }

 - Cell class

    	class SomeCell: UITableViewCell, ConfigurableCell {
		//MARK: - Properties 
		//MARK: - Functions internal 
		func configure<T>(viewModel: T) { }
		}

 
