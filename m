Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E672C8B
	for <regressions@lists.linux.dev>; Thu,  4 Nov 2021 06:53:45 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1miWd0-0003JW-1l; Thu, 04 Nov 2021 07:53:38 +0100
Message-ID: <466b8730-1424-dfc0-3f14-f279954188b9@leemhuis.info>
Date: Thu, 4 Nov 2021 07:53:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BZ
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: 5.14.14+ USB regression caused by "usb: core: hcd: Add support
 for deferring roothub registration" series
In-Reply-To: <42bcbea6-5eb8-16c7-336a-2cb72e71bc36@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1636008826;d41276ec;
X-HE-SMSGID: 1miWd0-0003JW-1l

On 03.11.21 10:02, Hans de Goede wrote:
> 
> We (Fedora) have been receiving multiple reports about USB devices stopping
> working starting with 5.14.14 .
> 
> An Arch Linux user has found that reverting the first 2 patches from this series:
> https://lore.kernel.org/all/20210909064200.16216-1-kishon@ti.com/
> 
> Fixes things (the 3th patch is just some mostly unrelated refactoring/cleanup).
> 
> See here for the Arch-linux discussion surrounding this:
> https://bbs.archlinux.org/viewtopic.php?pid=2000956#p2000956
> 
> And here are 2 Fedora bug reports of Fedora users being unable to use their
> machines due their mouse + kbd not working:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2019542
> https://bugzilla.redhat.com/show_bug.cgi?id=2019576
> 
> Can we get this patch-series reverted from the 5.14.y releases please ?
#regzbot ^introduced: b7a0a792f864583207c593b50fd1b752ed89f4c1
#regzbot ignore-activity
