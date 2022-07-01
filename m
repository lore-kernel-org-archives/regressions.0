Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DAB10E8
	for <regressions@lists.linux.dev>; Fri,  1 Jul 2022 05:54:34 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o793J-000344-Co; Fri, 01 Jul 2022 07:18:49 +0200
Message-ID: <ba461782-a4a7-87f1-bbd4-74fc403d0bb2@leemhuis.info>
Date: Fri, 1 Jul 2022 07:18:48 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Intermittent performance regression related to ipset between 5.10
 and 5.15 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <BY5PR13MB3604D24C813A042A114B639DEE109@BY5PR13MB3604.namprd13.prod.outlook.com>
 <5e56c644-2311-c094-e099-cfe0d574703b@leemhuis.info>
In-Reply-To: <5e56c644-2311-c094-e099-cfe0d574703b@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1656654874;f9a2326a;
X-HE-SMSGID: 1o793J-000344-Co

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filte=
r.

On 16.03.22 10:17, Thorsten Leemhuis wrote:
> [TLDR: I'm adding the regression report below to regzbot, the Linux
> kernel regression tracking bot; all text you find below is compiled fro=
m
> a few templates paragraphs you might have encountered already already
> from similar mails.]
>=20
> On 16.03.22 00:15, McLean, Patrick wrote:
>> When we upgraded from the 5.10 (5.10.61) series to the 5.15 (5.15.16) =
series, we encountered an intermittent performance regression that appear=
s to be related to iptables / ipset. This regression was noticed on Kuber=
netes hosts that run kube-router and experience a high amount of churn to=
 both iptables and ipsets. Specifically, when we run the nftables (iptabl=
es-1.8.7 / nftables-1.0.0) iptables wrapper xtables-nft-multi on the 5.15=
 series kernel, we end up getting extremely laggy response times when ipt=
ables attempts to lookup information on the ipsets that are used in the i=
ptables definition. This issue isn=E2=80=99t reproducible on all hosts. H=
owever, our experience has been that across a fleet of ~50 hosts we exper=
ienced this issue on ~40% of the hosts. When the problem evidences, the t=
ime that it takes to run unrestricted iptables list commands like iptable=
s -L or iptables-save gradually increases over the course of about 1 - 2 =
hours. Growing from less than a second to run, to taking sometimes over 2=
 minutes to run. After that 2 hour mark it seems to plateau and not grow =
any longer. Flushing tables or ipsets doesn=E2=80=99t seem to have any af=
fect on the issue. However, rebooting the host does reset the issue. Occa=
sionally, a machine that was evidencing the problem may no longer evidenc=
e it after being rebooted.
>>
>> We did try to debug this to find a root cause, but ultimately ran shor=
t on time. We were not able to perform a set of bisects to hopefully narr=
ow down the issue as the problem isn=E2=80=99t consistently reproducible.=
 We were able to get some straces where it appears that most of the time =
is spent on getsockopt() operations. It appears that during iptables oper=
ations, it attempts to do some work to resolve the ipsets that are linked=
 to the iptables definitions (perhaps getting the names of the ipsets the=
mselves?). Slowly that getsockopt request takes more and more time on aff=
ected hosts. Here is an example strace of the operation in question:
> [...]
> #regzbot ^introduced v5.10..v5.15
> #regzbot title net: netfilter: Intermittent performance regression
> related to ipset
> #regzbot ignore-activity

#regzbot introduced 3976ca101990ca11ddf51f38bec7b86c19d0ca

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
