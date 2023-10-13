Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5114AA8
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 13:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qrI93-0003Hg-1g; Fri, 13 Oct 2023 15:24:01 +0200
Message-ID: <b96190f1-44f4-4562-9030-6916e97c8b82@leemhuis.info>
Date: Fri, 13 Oct 2023 15:24:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: devcoredump patch broke Realtek usb bluetooth adapter
Content-Language: en-US, de-DE
To: Linux Regressions <regressions@lists.linux.dev>
Cc: Linux Bluetooth <linux-bluetooth@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20231003182038.k57nirtt4sonvt7c@box.shutemov.name>
 <ZRyqIn0_qqEFBPdy@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZRyqIn0_qqEFBPdy@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1697203444;ae4153b3;
X-HE-SMSGID: 1qrI93-0003Hg-1g

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 04.10.23 01:56, Bagas Sanjaya wrote:
> On Tue, Oct 03, 2023 at 09:20:38PM +0300, Kirill A. Shutemov wrote:
>>
>> Commit 044014ce85a1 ("Bluetooth: btrtl: Add Realtek devcoredump support")
>> broke Realtek-based ASUS USB-BT500, ID 0b05:190e.
>>
>> Devices failed to connect. hciconfig showed a controller with all-zero BD
>> address.

#regzbot fix: Bluetooth: btrtl: Ignore error return for hci_devcd_register()
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


