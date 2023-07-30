Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F83C644
	for <regressions@lists.linux.dev>; Sun, 30 Jul 2023 04:49:38 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qPyN1-0000Tk-CT; Sun, 30 Jul 2023 06:49:31 +0200
Message-ID: <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
Date: Sun, 30 Jul 2023 06:49:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: 6.5 - 6.4.7 Regression : ASUS UM5302TA Keyboard don't work
Content-Language: en-US, de-DE
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Linux Input Devices <linux-input@vger.kernel.org>,
 ACPI Asus <acpi4asus-user@lists.sourceforge.net>,
 Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Guilhem Lettron <guilhem@lettron.fr>
References: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1690692579;959a77ba;
X-HE-SMSGID: 1qPyN1-0000Tk-CT

Lo!

On 30.07.23 04:41, Bagas Sanjaya wrote:
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> On a kernel 6.4.5 and less, the keyboard is working fine.
>>
>> Beginning with 6.5 rc1 and 6.4.7 any key don't respond.

That is a AMD Ryzen Laptop. And if that really started from
v6.4.6..v6.4.7 then I guess there is a decent chance that this is caused
by ```ACPI: resource: Remove "Zen" specific match and quirks``` from
Mario. Hence adding him to the list of recipients.

Guilhem Lettron: if you have a minute, could you try if reverting that
patch ontop of 6.4.7 fixes things?

Ciao, Thorsten

>> [    0.668850] input: ASUE140D:00 04F3:31B9 Keyboard as /devices/platform/AMDI0010:01/i2c-1/i2c-ASUE140D:00/0018:04F3:31B9.0001/input/input5
>> ...
>> [    1.930328] input: ASUE140D:00 04F3:31B9 Keyboard as /devices/platform/AMDI0010:01/i2c-1/i2c-ASUE140D:00/0018:04F3:31B9.0001/input/input13
> 
> See Bugzilla for the full thread.
> 
> Anyway, I'm adding this regression to regzbot:
> 
> #regzbot introduced: v6.4..v6.5-rc1 https://bugzilla.kernel.org/show_bug.cgi?id=217726
> #regzbot title: ASUE140D:00 04F3:31B9 doesn't respond to input
> 
> Thanks.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217726

