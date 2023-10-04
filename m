Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A180D80A
	for <regressions@lists.linux.dev>; Wed,  4 Oct 2023 04:45:02 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qntkk-0007Y7-3n; Wed, 04 Oct 2023 06:44:54 +0200
Message-ID: <ac755d6d-7b3e-45b7-bd1f-e2c79de9d8eb@leemhuis.info>
Date: Wed, 4 Oct 2023 06:44:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rt8000usb driver issue (maybe interaction with other drivers)
Content-Language: en-US, de-DE
To: enc0der <enc0der@gmail.com>, Stanislaw Gruszka <stf_xl@wp.pl>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>
References: <CAEXpi5Rd6Y4umKOWRsCjX0kit=W5ZrVhn=MuRkyvJPwmjjDVnA@mail.gmail.com>
 <ZRj_ovMi-Xbb8i-D@debian.me> <20231002185053.GB402943@wp.pl>
 <CAEXpi5StYwujiTaH2_5PE9Hg_cgzAEtBuFxfgVxEJvbqRNv_4A@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAEXpi5StYwujiTaH2_5PE9Hg_cgzAEtBuFxfgVxEJvbqRNv_4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1696394703;d64e8887;
X-HE-SMSGID: 1qntkk-0007Y7-3n

On 04.10.23 03:34, enc0der wrote:
>
> [ 1542.248686] CPU: 3 PID: 29 Comm: ksoftirqd/3 Tainted: G        W
> OE     5.10.120-tegra #1

FWIW, 5.10.120 is ancient from the upstream perspective. And I assume
that "-tegra" indicates that this is a vendor kernel that most likely is
heavily patched -- and those changes might be the reason for the
problem. Therefore you should report this to your vendor. See "Make sure
you're using the upstream Linux kernel" in
https://docs.kernel.org/admin-guide/reporting-issues.html for details.

If you want help from the upstream Linux kernel developers, please
reproduce the problem with latest mainline.

Ciao, Thorsten
