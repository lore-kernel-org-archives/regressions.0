Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7FE34D7D
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 10:33:03 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q6Tze-0000VO-4a; Tue, 06 Jun 2023 12:32:50 +0200
Message-ID: <f55d98c0-69c8-23d6-1b07-57597f4d4066@leemhuis.info>
Date: Tue, 6 Jun 2023 12:32:49 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] Revert "drm/msm/dp: set self refresh aware based on PSR
 support"
Content-Language: en-US, de-DE
To: Johan Hovold <johan@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 regressions@lists.linux.dev
References: <20230523151646.28366-1-johan+linaro@kernel.org>
 <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
 <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>
 <ZH22jMTq6fi8iBpe@hovoldconsulting.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZH22jMTq6fi8iBpe@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686047583;e2e2e1ed;
X-HE-SMSGID: 1q6Tze-0000VO-4a



On 05.06.23 12:18, Johan Hovold wrote:
> On Mon, Jun 05, 2023 at 01:05:36PM +0300, Dmitry Baryshkov wrote:
>> On Mon, 5 Jun 2023 at 13:02, Johan Hovold <johan@kernel.org> wrote:
> 
>>> Virtual terminals are still broken with 6.4-rc5 on the Lenovo ThinkPad
>>> X13s two weeks after I reported this, and there has been no indication
>>> of any progress in the other related thread:
>>>
>>>         https://lore.kernel.org/lkml/ZHYPHnWoDbXB-fqe@hovoldconsulting.com
>>>
>>> Seems like it is time to merge this revert to get this sorted.

BTW, thx for bringing this to my attention!

>>> Rob, Abhinav, Dmitry, can either of you merge this one and get it into
>>> 6.4-rc6?
>>
>> Rob sent the pull request few hours ago, see
>> https://lore.kernel.org/dri-devel/CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com/
> 
> Ok, so you guys went with the module parameter hack. Whatever. As long
> as the regression is finally fixed.

Yup. Let me tell regzbot about the fix:

#regzbot fix: drm/msm/dp: add module parameter for PSR
#regzbot ignore-activity

> Next time, some visibility into your process would be appreciated to
> avoid unnecessary work.

Yeah, that's something we IMHO sooner or later need to improve for all
of kernel development -- among others to give people that find existing
bug reports a chance to find patches that were posted or applied to
address the issue (and of course reporters also, like in this case).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

