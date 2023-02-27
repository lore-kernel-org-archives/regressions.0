Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AD77EF
	for <regressions@lists.linux.dev>; Mon, 27 Feb 2023 08:21:53 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pWYlU-0006tU-CQ; Mon, 27 Feb 2023 09:21:44 +0100
Message-ID: <73f8ce97-ad66-11bb-f3a9-bc1aa324aeb8@leemhuis.info>
Date: Mon, 27 Feb 2023 09:21:43 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US, de-DE
To: David Gow <davidgow@google.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, rmoar@google.com,
 brendanhiggins@google.com, skhan@linuxfoundation.org,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CABXGCsO4=qKBF=2FRPVwW8FA4iLFh0Dt9n1BLMec3k10GUorpg@mail.gmail.com>
 <9f682c4d-e7b7-5e23-84f5-cea4fdac2085@leemhuis.info>
 <CABXGCsNruNKfx3d1dpneRUvn3dCqv_bM93TdJsCLeRYiP3qYaA@mail.gmail.com>
 <6bfa6d67-27ce-04b3-a1f9-3768b8a0169f@leemhuis.info>
 <CABVgOSnCLbqHHA-gT6FwtJYKYAHt_9uwR_S2r6ZE8hm6eZaLBA@mail.gmail.com>
 <f6616a9e-d250-b808-8c2c-e321e215f622@leemhuis.info>
 <CABVgOS=7JMGisPq_QUQpKV1mz8z8D2Esg0TwdMKx23yJhPbQGw@mail.gmail.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [6.3][regression] after commit
 7170b7ed6acbde523c5d362c8978c60df4c30f30 my system stuck in initramfs forever
In-Reply-To: <CABVgOS=7JMGisPq_QUQpKV1mz8z8D2Esg0TwdMKx23yJhPbQGw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1677486113;0f856abd;
X-HE-SMSGID: 1pWYlU-0006tU-CQ

On 26.02.23 08:31, David Gow wrote:
> On Sun, 26 Feb 2023 at 14:02, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>> On 26.02.23 02:11, David Gow wrote:
>>> On Sat, 25 Feb 2023 at 23:53, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>>>> On 25.02.23 15:55, Mikhail Gavrilov wrote:
>>>>> On Sat, Feb 25, 2023 at 7:22 PM Thorsten Leemhuis <linux@leemhuis.info> wrote:
>>>>>>
>>>>>> [CCing the regression list, as it should be in the loop for regressions:
>>>>>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>>>>>>
>>>>>> On 25.02.23 14:51, Mikhail Gavrilov wrote:
>>>>>>> new kernel release cycle returning with new bugs
>>>>>>> Today my system got stuck in initramfs environment after updating to
>>>>>>> commit d2980d8d826554fa6981d621e569a453787472f8.
>>>>>>>
>>>>>>> I still do not understand how to configure the network inside the
>>>>>>> initramfs environment to grab the logs.
>>>>>>> Since an attempt to rebuild the initramfs with all modules (dracut
>>>>>>> --no-hostonly --force) leads to the stuck initramfs environment and
>>>>>>> impossible entering into initramfs console.
>>>>>>
>>>>>> Do you see any error messages? I have problems since Friday morning as
>>>>>> well (stuck in Fedora's initramfs) and see a lot of BPF warnings like
>>>>>> "BPF: invalid name" and "failed to validate module". Was able to do a
>>>>>> screenshot:
>>>>>>
>>>>>> https://www.leemhuis.info/files/misc/Screenshot_ktst-f36-x86-64_2023-02-24_07:53:14.png
>>>>>
>>>>> I also seen such messages
>>>>> https://freeimage.host/i/img-1475.HMPL26l
>>>>
>>>> Pretty sure that's the same problem, at least the symptoms match. If
>>>> anyone needs a config to reproduce this, here's one of mine that shows
>>>> the problem:
>>>>
>>>> https://www.leemhuis.info/files/misc/config
>>>>
>>>>> P.S.: I also use Fedora Rawhide.
>>>>
>>>> Happens for me on all Fedora 36, 37, and 38 (my rawhide build failed for
>>>> other reasons, so I couldn't test).
>>>
>>> Thanks for the report, and sorry this seems to have broken.
>>>
>>> I've not been able to reproduce this locally yet, but I'm looking into it.
>>>
>>> In the meantime, a few questions if you have time:
>>> - Does this happen with CONFIG_KUNIT=y as well as CONFIG_KUNIT=m?
>>> - Does this patch fix it?
>>> https://lore.kernel.org/linux-kselftest/20230225014529.2259752-1-davidgow@google.com/T/#u
>>
>> Sorry, limited time and about to leave the house for the day. I only
>> could try the latter and did only do a very quick test, but it seems
>> that patch fixes the issue for me.
>>
> 
> Thanks! Glad to hear that patch seems to fix it: we'll try to get it
> upstream as soon as possible, then.

Great. I did some more tests (still not much) earlier today, feel free

Tested-by: Thorsten Leemhuis <linux@leemhuis.info>

but I don't care if that doesn't make it.

> I wouldn't worry about testing with CONFIG_KUNIT=y as well at this
> point: I doubt it'll shed any more light on the situation.
> 
> I've still been unable to reproduce the issue here, even with a fresh
> install of Fedora Rawhide, and a very recent torvalds/master:

Strange. Wondering if that has something to do with the way Mikhail and
I build the kernel. I'm build using something that very closely
resembles the SRPM used by Fedora.

> [...]
> Given everything else seems fine here, and the makefile issues fixed
> by the above patch both seems to fix this, and is the only real issue
> I could imagine having unpredictable behaviour, I'm reasonably happy
> to consider this "fixed" by that patch. But if this patch _doesn't_
> fix it, or you continue to see some other strange behaviour, we can
> look into fixing it further.

+1

Ciao, Thorsten
