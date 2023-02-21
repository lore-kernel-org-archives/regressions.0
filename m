Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D24C64
	for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 15:03:23 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pUUAi-0002sD-Ml; Tue, 21 Feb 2023 16:03:12 +0100
Message-ID: <9a0bfef8-0b5d-f4d0-a8a5-4bbcacc5c0fb@leemhuis.info>
Date: Tue, 21 Feb 2023 16:03:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] Revert "venus: firmware: Correct non-pix start and end
 addresses"
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Vikash Garodia <vgarodia@qti.qualcomm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mka@chromium.org" <mka@chromium.org>, Albert Esteve <aesteve@redhat.com>,
 "stanimir.varbanov@linaro.org" <stanimir.varbanov@linaro.org>,
 Enric Balletbo i Serra <eballetb@redhat.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Fritz Koenig <frkoenig@google.com>,
 "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>,
 "Rajeshwar Kurapaty (QUIC)" <quic_rkurapat@quicinc.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230207102254.1446461-1-javierm@redhat.com>
 <DM8PR02MB8169809493BF2822E6C29EECF3DB9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <ef09bc9f-d570-be11-238b-bd34063917fc@redhat.com>
 <70c01751-1dd7-c4bd-a96e-94dea437aa40@redhat.com>
 <DM8PR02MB81696369DBFE619E43F81EEFF3DE9@DM8PR02MB8169.namprd02.prod.outlook.com>
 <e87344c6-acef-7f3f-5cac-24961dbd9401@redhat.com>
 <6f97a117-0d9c-e21b-9adf-50f2233ba9e3@leemhuis.info>
 <ea283f0a-ca72-447e-ce87-68c1bbee793e@leemhuis.info>
 <CAFOAJEdBbzqkGVqw+vgNYNxyaTHwvjFyskTwjycP820L2tOctA@mail.gmail.com>
 <b548da46-bf91-6f1c-4b63-4002109056bc@leemhuis.info>
In-Reply-To: <b548da46-bf91-6f1c-4b63-4002109056bc@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676991803;edc44f9c;
X-HE-SMSGID: 1pUUAi-0002sD-Ml

On 15.02.23 14:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 15.02.23 11:57, Javier Martinez Canillas wrote:
>> On Wed, Feb 15, 2023 at 11:53 AM Linux regression tracking (Thorsten
>> Leemhuis) <regressions@leemhuis.info> wrote:
>>> On 11.02.23 15:27, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>> On 10.02.23 11:07, Javier Martinez Canillas wrote:
>>>>> On 2/10/23 10:22, Vikash Garodia wrote:
>>>>>
>>>>>>> So what should we do about this folks? Since not allowing the driver to probe on
>>>>>>> at least SC7180 is a quite serious regression, can we revert for now until a proper
>>>>>>> fix is figured out?
>>>>>> I am able to repro this issue on sc7180 and discussing with firmware team on the cause
>>>>>> of reset failure. The original patch was raised for fixing rare SMMU faults during warm
>>>>>> boot of video hardware. Hence looking to understand the regressing part before we
>>>>>> proceed to revert.
>>>>> Great, if you are working on a proper fix then that would be much better indeed.
>>>> Yeah, that's great, but OTOH: there is almost certainly just one week
>>>> before 6.2 will be released. Ideally this should be fixed by then.
>>>> Vikash, do you think that's in the cards? If not: why not revert this
>>>> now to make sure 6.2 works fine?
>>> Hmm, no reply. And we meanwhile have Wednesday and 6.2 is almost
>>> certainly going to be out on Sunday. And the problem was called "a quite
>>> serious regression" above. So why not quickly fix this with the revert,
>>> as proposed earlier?
>>> Vikash? Javier?
>>
>> I agree with you, that we should land this revert and then properly
>> fix the page fault issue in v6.3.
>>
>> But it's not my call, the v4l2/media folks have to decide that.
> 
> In that case: Mauro, what's your opinion here?
> 
> Thread starts here:
> https://lore.kernel.org/lkml/20230207102254.1446461-1-javierm@redhat.com/
> 
> Regression report:
> https://lore.kernel.org/lkml/Y9LSMap%2BjRxbtpC8@google.com/

No reply from Mauro and Linus chose to not apply the revert I pointed
him to. That at this point leads to the question:

Vikash, did you or somebody else make any progress to fix this properly?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke
