Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CF6FC8
	for <regressions@lists.linux.dev>; Fri, 14 Jul 2023 11:04:22 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qKGav-000446-TI; Fri, 14 Jul 2023 13:04:17 +0200
Message-ID: <c7461674-6be8-9438-55fa-ae6b4d56d3b5@leemhuis.info>
Date: Fri, 14 Jul 2023 13:04:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes
 up
Content-Language: en-US, de-DE
To: Amit Pundir <amit.pundir@linaro.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info>
 <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
 <CAD=FV=Xt2KYGY15+f+nHxkzKnwhHzw1A7=o+5kgCDWvHDv0DNg@mail.gmail.com>
 <20230620155902.clspxncyvpodixft@ripper>
 <5240ce3f-37fa-2747-92ee-23d71619f3ef@leemhuis.info>
 <CAMi1Hd2zunc=WNUE7KT-423RXTiX6LrY2hcWQdV3Dp3o8RdJtg@mail.gmail.com>
 <CAMi1Hd2L-j9GHQH+4O6j6m2+HGy5oEsdMv6Qyp4RaWZDNCj-Bw@mail.gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAMi1Hd2L-j9GHQH+4O6j6m2+HGy5oEsdMv6Qyp4RaWZDNCj-Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689332662;477d014a;
X-HE-SMSGID: 1qKGav-000446-TI

On 07.07.23 07:08, Amit Pundir wrote:
> On Thu, 22 Jun 2023 at 17:18, Amit Pundir <amit.pundir@linaro.org> wrote:
>> On Thu, 22 Jun 2023 at 13:17, Linux regression tracking (Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>>
>>> As Linus will likely release 6.4 on this or the following Sunday a quick
>>> status inquiry so I can brief him appropriately: is there any hope the
>>> regression this patch tried to fix will be resolved any time soon?
>>
>> We are most likely to miss v6.4. I'm trying to reproduce the crash
>> with tracing enabled, to share some more debug information.
> 
> FWIW, I couldn't reproduce this bug on v6.5 merge window commit
> d528014517f2 (Revert ".gitignore: ignore *.cover and *.mbx")
> on 100+ boot tests last night.
> For the time being I'm keeping an eye on it and will trigger the boot
> tests occasionally in the v6.5 development cycle.

No update since then, so I assume this remains fixed. I'll thus remove
this from the tracking; please holler if you think it might make sense
to continue tracking this.

#regzbot resolved: apparently solved with during the 6.5 merge window
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
