Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1342F21
	for <regressions@lists.linux.dev>; Sat,  5 Feb 2022 05:17:34 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nGDS0-0007CA-TU; Sat, 05 Feb 2022 06:17:32 +0100
Message-ID: <33f5aac4-85ee-faae-15a7-ae90d78ed1c0@leemhuis.info>
Date: Sat, 5 Feb 2022 06:17:32 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/5] acpi: Store CRC-32 hash of the _PLD in struct
 acpi_device #forregzbot
Content-Language: en-BS
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20211223081620.45479-1-heikki.krogerus@linux.intel.com>
 <20211223081620.45479-3-heikki.krogerus@linux.intel.com>
 <20220130164126.GA2942650@roeck-us.net>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220130164126.GA2942650@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1644038254;d2de4205;
X-HE-SMSGID: 1nGDS0-0007CA-TU

For the record:

#regzbot fixed-by: 04662bac0067e2fd7f243d6abaa4d779bce14114

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 30.01.22 17:41, Guenter Roeck wrote:
> On Thu, Dec 23, 2021 at 11:16:17AM +0300, Heikki Krogerus wrote:
>> Storing CRC-32 hash of the Physical Location of Device
>> object (_PLD) with devices that have it. The hash is stored
>> to a new struct acpi_device member "pld_crc".
>>
>> The hash makes it easier to find devices that share a
>> location, as there is no need to evaluate the entire object
>> every time. Knowledge about devices that share a location
>> can be used in device drivers that need to know the
>> connections to other components inside a system. USB3 ports
>> will for example always share their location with a USB2
>> port.
>>
>> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Building ia64:tinyconfig ... failed
> 
> ia64-linux-ld: drivers/acpi/scan.o: in function `__acpi_device_add':
> scan.c:(.text+0x27e2): undefined reference to `crc32_le'
> 
> ACPI now depends on CRC32.
> 
> #regzbot introduced: 882c982dada4d5
> 
> Guenter
> 
>> ---
>>  drivers/acpi/scan.c     | 16 ++++++++++++++++
>>  include/acpi/acpi_bus.h |  1 +
>>  2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
>> index 7ff55a197a583..113414c46b713 100644
>> --- a/drivers/acpi/scan.c
>> +++ b/drivers/acpi/scan.c
>> @@ -19,6 +19,7 @@
>>  #include <linux/dma-map-ops.h>
>>  #include <linux/platform_data/x86/apple.h>
>>  #include <linux/pgtable.h>
>> +#include <linux/crc32.h>
>>  
>>  #include "internal.h"
>>  
>> @@ -667,6 +668,19 @@ static int acpi_tie_acpi_dev(struct acpi_device *adev)
>>  	return 0;
>>  }
>>  
>> +static void acpi_store_pld_crc(struct acpi_device *adev)
>> +{
>> +	struct acpi_pld_info *pld;
>> +	acpi_status status;
>> +
>> +	status = acpi_get_physical_device_location(adev->handle, &pld);
>> +	if (ACPI_FAILURE(status))
>> +		return;
>> +
>> +	adev->pld_crc = crc32(~0, pld, sizeof(*pld));
>> +	ACPI_FREE(pld);
>> +}
>> +
>>  static int __acpi_device_add(struct acpi_device *device,
>>  			     void (*release)(struct device *))
>>  {
>> @@ -725,6 +739,8 @@ static int __acpi_device_add(struct acpi_device *device,
>>  	if (device->wakeup.flags.valid)
>>  		list_add_tail(&device->wakeup_list, &acpi_wakeup_device_list);
>>  
>> +	acpi_store_pld_crc(device);
>> +
>>  	mutex_unlock(&acpi_device_lock);
>>  
>>  	if (device->parent)
>> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
>> index 8e87ead2af341..f8c945418df23 100644
>> --- a/include/acpi/acpi_bus.h
>> +++ b/include/acpi/acpi_bus.h
>> @@ -360,6 +360,7 @@ struct acpi_gpio_mapping;
>>  
>>  /* Device */
>>  struct acpi_device {
>> +	u32 pld_crc;
>>  	int device_type;
>>  	acpi_handle handle;		/* no handle for fixed hardware */
>>  	struct fwnode_handle fwnode;

