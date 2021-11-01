Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7CE2C85
	for <regressions@lists.linux.dev>; Mon,  1 Nov 2021 16:46:53 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mhaSS-0000uo-5y; Mon, 01 Nov 2021 17:46:52 +0100
Message-ID: <fd7df619-3eba-b142-cc20-97edf9f20c4d@leemhuis.info>
Date: Mon, 1 Nov 2021 17:46:51 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-BW
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
 <c639c965-5231-b745-7b59-476877202e0c@gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v2] usb: core: reduce power-on-good delay time of root hub
In-Reply-To: <c639c965-5231-b745-7b59-476877202e0c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1635785213;5973fd49;
X-HE-SMSGID: 1mhaSS-0000uo-5y

On 01.11.21 04:33, Walt Jr. Brake wrote:
> Three month ago, My USB 3.1 device cannot be detected after upgrade
> kernel from version 5.10.41 to 5.10.42.
> 
> And I found some other people ran into the same issue:
> 
> https://forum.manjaro.org/t/kernel-5-10-59-doesnt-detect-a-connected-usb-external-disk/79320
> 
> https://forum.manjaro.org/t/how-to-make-active-usb-hub-work-in-manjaro/84548
> 
> 
> Two days ago, I try to fix the issue myself, and I found out that it was
> cause by this patch. After revert this patch, my USB 3.1 device can be
> detect again.
> 
> I have already file a bug on here:
> https://bugzilla.kernel.org/show_bug.cgi?id=214875.

#regzbot ^introduced 90d28fb53d4a51299ff324dede015d5cb11b88a2
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=214875
