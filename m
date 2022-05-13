Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C32100
	for <regressions@lists.linux.dev>; Fri, 13 May 2022 08:16:13 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1npQSy-0006PS-Nd; Fri, 13 May 2022 10:16:05 +0200
Message-ID: <dfff630d-1408-5306-d70f-297f934ee8a4@leemhuis.info>
Date: Fri, 13 May 2022 10:16:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Fwd: Re: amd | ASUS ROG Strix G513QY fails to resume from suspend
 [regression] (#2008) #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
References: <note_1375796@gitlab.freedesktop.org>
 <66e1d78c-bf27-80b4-9804-6c9f3a8c5547@molgen.mpg.de>
 <2192e546-cac7-f802-2297-3461a1cf8e03@leemhuis.info>
In-Reply-To: <2192e546-cac7-f802-2297-3461a1cf8e03@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652429773;39973dc9;
X-HE-SMSGID: 1npQSy-0006PS-Nd

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 10.05.22 12:33, Thorsten Leemhuis wrote:
> On 10.05.22 10:37, Paul Menzel wrote:
>> Dear Linux regressions folks,
>>
>> A user reported a regression [1], which also trickled down to the stable
>> series, for example between 5.15.13 and 5.15.14.
>>
>> [1]: https://gitlab.freedesktop.org/drm/amd/-/issues/2008
> 
> Many thx for forwarding. I'll add it to the tracking to ensure it's not
> forgotten:
> 
> #regzbot introduced: 887f75cfd0da44c19dd
> #regzbot from: spin83
> #regzbot title: drm: amdgpu: ASUS ROG Strix G513QY fails to resume from
> suspend
> #regzbot link: https://gitlab.freedesktop.org/drm/amd/-/issues/2008
> 
> Maybe the culprit is actually daf8de0874ab5b74b38a38726fdd3d, the report
> is not clear on that, I just picked the newest the reporter mentioned
> for now.

#regzbot introduced: eaa090538e8d21801c6d5f94590c3799e6a5
#regzbot fixed-by: a56f445f807b0276

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.



