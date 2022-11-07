Received: from smtp.tom.com (smtprz25.163.net [106.38.219.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AD715AC
	for <regressions@lists.linux.dev>; Mon,  7 Nov 2022 01:38:02 +0000 (UTC)
Received: from my-app02.tom.com (my-app02.tom.com [127.0.0.1])
	by freemail02.tom.com (Postfix) with ESMTP id 8CA37B00CC4
	for <regressions@lists.linux.dev>; Mon,  7 Nov 2022 09:25:53 +0800 (CST)
Received: from my-app02.tom.com (HELO smtp.tom.com) ([127.0.0.1])
          by my-app02 (TOM SMTP Server) with SMTP ID -751839043
          for <regressions@lists.linux.dev>;
          Mon, 07 Nov 2022 09:25:53 +0800 (CST)
Received: from antispam1.tom.com (unknown [172.25.16.55])
	by freemail02.tom.com (Postfix) with ESMTP id 7FBB2B00CBF
	for <regressions@lists.linux.dev>; Mon,  7 Nov 2022 09:25:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tom.com; s=201807;
	t=1667784353; bh=CZPj/gYTHe0cbu9G9cAtpVDX1hQqwl2Q6jjzkB5MRCc=;
	h=Date:To:Cc:From:Subject:From;
	b=5e73HIPbkh5dPUv+WFpuLj6DJyOqAdSzsgyatwb+wRZ4o01w5UcJFYptT0XQJ6QOk
	 /G+JgCFHyI3dj6RJD/fF90SNOGEvIiSMXT6jmZ1pIu4EmP62I2SoL8iFDIvln+kM9k
	 L8+Q1Z5++vkuTRgxy/e2Pj6/qf62AKdLK0GNHisI=
Received: from antispam1.tom.com (antispam1.tom.com [127.0.0.1])
	by antispam1.tom.com (Postfix) with ESMTP id 20F29D41786
	for <regressions@lists.linux.dev>; Mon,  7 Nov 2022 09:25:52 +0800 (CST)
X-Virus-Scanned: Debian amavisd-new at antispam1.tom.com
Received: from antispam1.tom.com ([127.0.0.1])
	by antispam1.tom.com (antispam1.tom.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmF6HMjf1yWA for <regressions@lists.linux.dev>;
	Mon,  7 Nov 2022 09:25:50 +0800 (CST)
Received: from [192.168.0.106] (unknown [120.207.227.204])
	by antispam1.tom.com (Postfix) with ESMTPA id CB421D41357;
	Mon,  7 Nov 2022 09:25:49 +0800 (CST)
Message-ID: <39ebab39-fb03-4be4-ec00-c5665f19fbdd@tom.com>
Date: Mon, 7 Nov 2022 09:25:51 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: stable@vger.kernel.org
Content-Language: en-US
Cc: regressions@lists.linux.dev
From: malaizhichun <malaizhichun@tom.com>
Subject: This is about the acip-bios problem
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Please what time  the acpi-bios error reported by the dmesg command will 
be fixed, it's really annoying. I have never been able to eliminate such 
reports, it's only to insert loglevel=3 in grub settings to block. But 
it doesn't solve the problem, and  I use google search , it's tells me 
that fix this problem need a bios upgrade, but actually my hardware has  
stopped upgrade, so I don't know how to do fix this, thanks


[    0.160900] ACPI: Added _OSI(Processor Aggregator Device)
[    0.160900] ACPI: Added _OSI(Linux-Dell-Video)
[    0.160900] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.160900] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.219876] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.PCI0.XHC.RHUB.TPLD], AE_ALREADY_EXISTS (20220331/dswload2-326)
[    0.219885] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20220331/psobject-220)
[    0.219889] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0014)
[    0.219944] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS01], AE_NOT_FOUND (20220331/dswload2-162)
[    0.219950] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)
[    0.219953] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0010)
[    0.219983] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS02], AE_NOT_FOUND (20220331/dswload2-162)
[    0.219987] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)
[    0.219990] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0010)
[    0.220019] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS03], AE_NOT_FOUND (20220331/dswload2-162)
[    0.220023] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)
[    0.220026] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0010)
[    0.220055] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS04], AE_NOT_FOUND (20220331/dswload2-162)
[    0.220059] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)
[    0.220062] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0010)
[    0.220090] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS05], AE_NOT_FOUND (20220331/dswload2-162)
[    0.220095] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)
[    0.220098] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0010)
[    0.220126] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS06], AE_NOT_FOUND (20220331/dswload2-162)
[    0.220130] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)
[    0.220133] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0010)
[    0.220162] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS07], AE_NOT_FOUND (20220331/dswload2-162)
[    0.220166] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)
[    0.220169] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0010)
[    0.220197] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS08], AE_NOT_FOUND (20220331/dswload2-162)
[    0.220202] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)
[    0.220205] ACPI: Skipping parse of AML opcode: OpcodeName 
unavailable (0x0010)
[    0.220233] ACPI BIOS Error (bug): Could not resolve symbol 
[\_SB.PCI0.XHC.RHUB.HS09], AE_NOT_FOUND (20220331/dswload2-162)
[    0.220237] ACPI Error: AE_NOT_FOUND, During name lookup/catalog 
(20220331/psobject-220)

