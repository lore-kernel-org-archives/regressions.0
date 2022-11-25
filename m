Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E223D8
	for <regressions@lists.linux.dev>; Fri, 25 Nov 2022 08:44:12 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oyUJe-0005qY-RV; Fri, 25 Nov 2022 09:44:10 +0100
Message-ID: <ea6bbb08-1784-74a0-8391-50374b80f524@leemhuis.info>
Date: Fri, 25 Nov 2022 09:44:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [REGRESSION] v6.0.x fails to boot after updating from v5.19.x
Content-Language: en-US, de-DE
To: Dominic Jones <jonesd@xmission.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <709b163021b2608789dab55eb3f9724c.dominic@xmission.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <709b163021b2608789dab55eb3f9724c.dominic@xmission.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669365853;11a06fb4;
X-HE-SMSGID: 1oyUJe-0005qY-RV

On 24.11.22 02:08, Dominic Jones wrote:
>> On Fri, Oct 28, 2022 at 02:51:43PM +0000, Dominic Jones wrote:
>>> Updating the machine's kernel from v5.19.x to v6.0.x causes the machine to not
>>> successfully boot. The machine boots successfully (and exhibits stable operation)
>>> with version v5.19.17 and multiple earlier releases in the 5.19 line. Multiple releases
>>> from the 6.0 line (including 6.0.0, 6.0.3, and 6.0.5), with no other changes to the
>>> software environment, do not boot. Instead, the machine hangs after loading services
>>> but before presenting a display manager; the machine instead shows repetitive hard
>>> drive activity at this point and then no apparent activity.
>>>
>>> ''uname'' output for the machine successfully running v5.19.17 is:
>>>
>>>     Linux [MACHINE_NAME] 5.19.17 #1 SMP PREEMPT_DYNAMIC Mon Oct 24 13:32:29 2022 i686 Intel(R) Atom(TM) CPU N270 @ 1.60GHz GenuineIntel GNU/Linux
>>>
>>> The machine is an OCZ Neutrino netbook, running a custom OS build largely similar to
>>> LFS development. The kernel update uses ''make olddefconfig''.
>>
>> Can you use 'git bisect' to find the offending change that causes this
>> to happen?
> 
> Bisection is complete. Here's what it returned.
> 
> ---
> 
> 3a194f3f8ad01bce00bd7174aaba1563bcc827eb is the first bad commit

Many thx for this. A fix for that particular commit for recently
committed to 6.0.y:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.0.y&id=bccc10be65e365ba8a3215cb702e6f57177eea07

That thus bears the question: does your problem still happen with the
latest 6.0.y version?

Ciao, Thorsten



