Received: from abi149hd125.arn1.oracleemaildelivery.com (abi149hd125.arn1.oracleemaildelivery.com [129.149.84.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138FE13ADF
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-arn1-20220924;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=lkeyCUNxw6Rc/OPS654INdsxLT2B3j/nzdnoNSEJjig=;
 b=bac6FmIFqM2VTXBwCerNcTs1vGSwGm1YskznsLbPIatRy6FNMCF0GpZOJe6uP/K2LzGhvGvYNKhv
   AFgxcTdVPaxd4yH41nkWVlvrB0QhIJozfiL5zG/LLPyGubxrRLd1XnfMtkq7+MnHH+EsoaXlOUZL
   1SHp9GIChx4CWxEUz7Kg3KlGqZz708Y06INpwUzBMwHQROF+Ameh3i36FxIYtKDOTF3ijsdkn3s4
   yRQf8S8uKtsCbslTRfbZlCLnHauQlg16rPnxNzCjS+0CP3GT5vGI/fj6Yfb3LGeC59Vv7N75+MG7
   7CUrBkZxMIl7yB80aZPpIVc00jbubo89NhzNvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-arn-20211201;
 d=arn1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=lkeyCUNxw6Rc/OPS654INdsxLT2B3j/nzdnoNSEJjig=;
 b=UQ/wioqw7YM345lLt/Rg5JZCedZ4CgI/TLJydeYOoOXCWITVJuslpve8uNh1b37zxAIYqD5jUTU2
   8HiF1MxGap3Y4scje345llC3CG5owAQtGVPe5uFR28am1ISnuJbAG7wOcdnWBak/AXb9XCwEr17V
   W0FDraxbITYS3WYQb8qSD27BKLDSOzWtO9LqS2dhB6o4oEQmqu23A+rs/lkMWk11iIDwwLXYTKS+
   LCFFVdUIjITOJhigCifcav24LBQlXvWxWK4AFqAxHCQH6D1mSo05tCgcPWPU91aMbXryEcLw0kzD
   yP7ayI3G+Qe0HlzN35WaXT6vpJtp5TI2gkWpyw==
Received: by omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20230707 64bit (built Jul  7
 2023))
 with ESMTPS id <0RYV0022WHJS1K80@omta-ad1-fd1-401-eu-stockholm-1.omtaad1.vcndparn.oraclevcn.com>
 for regressions@lists.linux.dev; Fri, 04 Aug 2023 15:26:16 +0000 (GMT)
Message-id: <b7df9a02-3b81-4f8c-aeba-222c298180d4@augustwikerfors.se>
Date: Fri, 4 Aug 2023 17:26:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-version: 1.0
Subject: Re: Fwd: 6.5 - 6.4.7 Regression : ASUS UM5302TA Keyboard don't work
Content-language: en-US
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Linux Input Devices <linux-input@vger.kernel.org>,
 ACPI Asus <acpi4asus-user@lists.sourceforge.net>,
 Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, Guilhem Lettron <guilhem@lettron.fr>
References: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
 <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
From: August Wikerfors <git@augustwikerfors.se>
In-reply-to: <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
Content-type: text/plain; charset=UTF-8; format=flowed
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAFFfLcUsxW36ThPzjsNnUXQm7U6Sr9gxxLdxvDmieyTQubvanypwsv0aq8t1egt
 VXasQBWsOdnmCguJTPNmbAfWd/iC2bEZITKUTWTVka+5zDhKz9pMjIeZ0wLD1MG9
 C8owx+6gcL4YGj90oCAYXIF+jEGeBTmslUkJgFaA1A8SGBMYlqkZK56McFgJlDu0
 r0scD7JFW1PNV1ku51zJouW97lV8zJQ9V7MXmrjzsVWerPICVl4tenNweD/fiPbr
 DSd8CBBSn14q/uh6i9scCs2rifw1d1ezjzOnTg/LRBGS5cl6azYFP9ZRD2BzyyXi
 /5aFaKaKL2XzJf3q73GCkQoUf7D8Bhns1EUK9sv7wCc4Unr85u/GGHi/++3txHhj
 msL9Rz4tdCSeuk+M6SsL7ZjSSJVi9LHORRB/fjMRFGBgCZg8x5a9t+ZdJF2P6UdS G/YMsiU=

On 2023-07-30 06:49, Linux regression tracking (Thorsten Leemhuis) wrote:
> Lo!
> 
> On 30.07.23 04:41, Bagas Sanjaya wrote:
>>
>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>
>>> On a kernel 6.4.5 and less, the keyboard is working fine.
>>>
>>> Beginning with 6.5 rc1 and 6.4.7 any key don't respond.
> 
> That is a AMD Ryzen Laptop. And if that really started from
> v6.4.6..v6.4.7 then I guess there is a decent chance that this is caused
> by ```ACPI: resource: Remove "Zen" specific match and quirks``` from
> Mario. Hence adding him to the list of recipients.

Confirmed now, see https://bugzilla.kernel.org/show_bug.cgi?id=217726#c9

#regzbot introduced: a9c4a912b7dc7ff922d4b9261160c001558f9755
