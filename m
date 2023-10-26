Received: from fgw22-4.mail.saunalahti.fi (fgw22-4.mail.saunalahti.fi [62.142.5.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B962F502
	for <regressions@lists.linux.dev>; Thu, 26 Oct 2023 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [192.168.1.15] (81-175-205-118.bb.dnainternet.fi [81.175.205.118])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTPSA
	id cf9cb88a-7414-11ee-a9de-005056bdf889;
	Thu, 26 Oct 2023 18:32:03 +0300 (EEST)
Message-ID: <7bfd4f9e-9f8d-4102-ab03-7d0401f00513@gmail.com>
Date: Thu, 26 Oct 2023 18:32:02 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: LihaSika <lihasika@gmail.com>
Subject: Linux kernel 6.1 - drivers/usb/storage/unusual_cypress.h "Super Top"
 minimum bcdDevice too high
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,	

in kernel 6.1 (maybe 5.x - 6.x) there's an ATACB setting for "Super Top 
USB 2.0 SATA Bridge" -devices, where the minimum bcdDevice version to 
match has been set to 1.60. It's in the file 
drivers/usb/storage/unusual_cypress.h:

"""
UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
  		"Super Top",
  		"USB 2.0  SATA BRIDGE",
  		USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),
"""

My old USB HDD with a "Super Top" bridge has bcdDevice version 1.50, 
thus the setting won't match and it will not mount.

I'm not sure when this changed (after kernel 4.x?), but it used to work 
before. Reading some earlier bug reports, it seems that the max version 
used to be 0x9999, which then caused corruption in "Super Top" devices 
with version >=2.20. So that's a reason for lowering the maximum value, 
but I wonder why the minimum value has also been set to 0x0160.


I created a patch, changing 0x0160 to 0x0150 (though I should've left 
the max version as it was...):

"""
UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0150,
"""

Built, installed and rebooted; now the USB HDD can be mounted and works 
perfectly again. I did some write & read tests, checked with diff, cmp 
and md5sum - no corruption, everything OK 👍


Best regards,
LihaS
