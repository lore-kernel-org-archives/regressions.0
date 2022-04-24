Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2897A
	for <regressions@lists.linux.dev>; Sun, 24 Apr 2022 09:02:53 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1niY8i-0006jt-AS; Sun, 24 Apr 2022 11:02:44 +0200
Message-ID: <e1950610-ba09-7c42-4a1a-152ad41015b5@leemhuis.info>
Date: Sun, 24 Apr 2022 11:02:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [REGRESSION] AMD GPU regression in 5.16.18..5.17.4
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <YmQi7ajZpZ4W7BJL@itl-email> <YmQkCXZEqp6TKrhJ@itl-email>
 <YmTqYkGEqiz1o2o6@kroah.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <YmTqYkGEqiz1o2o6@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1650790973;d6dd5590;
X-HE-SMSGID: 1niY8i-0006jt-AS

CCing the amdgpu maintainers

On 24.04.22 08:12, Greg KH wrote:
> On Sat, Apr 23, 2022 at 12:06:33PM -0400, Demi Marie Obenour wrote:
>> Two Qubes OS users reported that their AMD GPU systems did not work on
>> 5.17.4, while 5.16.18 worked fine.  Details can be found on
>> https://github.com/QubesOS/qubes-issues/issues/7462.  The initial report
>> listed the GPU as “Advanced Micro Devices, Inc. [AMD/ATI] Renoir
>> [1002:1636} (rev d3) (prog-if 00 [VGA controller])” and the CPU as
>> “AMD Ryzen 5 PRO 4650U with Radeon Graphics”.
>>
>> #regzbot introduced: v5.16.18..v5.17.4
> 
> That's a big range, can you use 'git bisect' to track it down?

FWIW, in another mail in this thread and
https://github.com/QubesOS/qubes-issues/issues/7462#issuecomment-1107681126
it was clarified that the problem was introduced between 5.17.3 and
5.17.4, where a few amdgpu changes were applied. Maybe they are the reason.

Anyway: Yes, as Gregkh said, a bisection really would help. But maybe
the amdgfx developers might already have an idea what might be wrong
here? The QubesOS ticket linked above has some more details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
