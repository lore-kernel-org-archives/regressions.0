Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855BE173
	for <regressions@lists.linux.dev>; Sat, 22 Jan 2022 08:56:25 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nBCC7-0003LR-CT; Sat, 22 Jan 2022 09:56:23 +0100
Message-ID: <99dc2b1f-2c46-04fb-86ea-92a748e495de@leemhuis.info>
Date: Sat, 22 Jan 2022 09:56:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Language: en-BS
Subject: Dual monitor with amd 5700 causes system to,hang at startup (fwd from
 bugzilla) #forregzbot
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1642841785;9579e87d;
X-HE-SMSGID: 1nBCC7-0003LR-CT

Lo! There is a regression dealt with in bugzilla I'd like to add to the
tracking:

#regzbot introduced: v5.15.8..v5.15.13
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215511
#regzbot from: Jose Mestre <pmestre@gmail.com>
#regzbot title: drm: amdgpu: Dual monitor with amd 5700 causes system to
hang at startup.

Note: also present in 5.16.1

Quote:

> Hello, system mostly crashes (sometimes in different ways) when i
> start with more than one monitor attached.
> 
> If i switch off one monitor then system boots correctly (i don't need
> to detach the displayport cable, just to switch off the monitor).
> 
> 
> When both monitors are connected, most of the times it just crashes
> as the attached log, sometimes it boots but screen is flickering and
> with artifacts.
> 
> This happened with kernel 5.10 and 5.11, it was fixed i don't
> remember exactly when, and is happening again. For me it worked with
> kernel 5.15.8 and failed with 5.15.13. It is still failing with
> 5.16.1.
> 
> Kind regards and many thanks for your work in the most crucial
> open-source project.

Ciao, Thorsten

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.
