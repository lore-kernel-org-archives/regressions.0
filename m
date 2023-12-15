Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961124A03;
	Fri, 15 Dec 2023 11:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rE6Gn-0005AR-Qc; Fri, 15 Dec 2023 12:22:17 +0100
Message-ID: <dbf9779d-9c6b-45bf-be52-1b8d6238643d@leemhuis.info>
Date: Fri, 15 Dec 2023 12:22:20 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Thinkpad X13 AMD: Problems with external monitor wake up
 after suspend
Content-Language: en-US, de-DE
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>
References: <8da256ea-b069-44f0-9cc2-93482c2f5eec@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <8da256ea-b069-44f0-9cc2-93482c2f5eec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1702639339;1cc1e828;
X-HE-SMSGID: 1rE6Gn-0005AR-Qc

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 01.12.23 01:30, Bagas Sanjaya wrote:
> 
>> Since kernel version 6.1.57 I have problems with external monitor wakeup after suspend on Thinkpad X13 AMD Gen2 Notebook.
>>
>> Notebook is in docking station with closed lid. Suspend & Resume. The external monitor gets no signal. After randomly typing Ctrl+Alt+Fn for switchung consoles, the monitor at some point gets signal and is usable again.

#regzbot resolve: firmware update for the dock fixed it
#regzbot ignore-activity

Side note: yes, that is not ideal, but it afaics is an acceptable
outcome in this case

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
