Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B141108
	for <regressions@lists.linux.dev>; Sun, 10 Jul 2022 08:06:29 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oARxL-0006ZT-Nu; Sun, 10 Jul 2022 10:06:19 +0200
Message-ID: <3b17592f-4118-5022-eaea-17b9059d3f0a@leemhuis.info>
Date: Sun, 10 Jul 2022 10:06:19 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: virtio_balloon regression in 5.19-rc3 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: virtualization@lists.linux-foundation.org
Cc: debian-kernel@lists.debian.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <64c567bc77c4fbe7bfe37467cc1c89d24a45c37a.camel@decadent.org.uk>
 <b5b67c54-e17d-64c5-7bec-00f0d5b5bae2@leemhuis.info>
 <0691ee28-bae2-6fda-bf35-207e1bf63636@leemhuis.info>
In-Reply-To: <0691ee28-bae2-6fda-bf35-207e1bf63636@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1657440389;20086566;
X-HE-SMSGID: 1oARxL-0006ZT-Nu



On 04.07.22 11:40, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> On 21.06.22 11:35, Thorsten Leemhuis wrote:
>> [TLDR: I'm adding this regression report to the list of tracked
>> regressions; all text from me you find below is based on a few templates
>> paragraphs you might have encountered already already in similar form.]
>>
>> On 20.06.22 20:49, Ben Hutchings wrote:
>>> I've tested a 5.19-rc3 kernel on top of QEMU/KVM with machine type
>>> pc-q35-5.2.  It has a virtio balloon device defined in libvirt as:
>>>
>>>     <memballoon model="virtio">
>>>       <address type="pci" domain="0x0000" bus="0x05" slot="0x00" function="0x0"/>
>>>     </memballoon>
>>>
>>> but the virtio_balloon driver fails to bind to it:
>>>
>>>     virtio_balloon virtio4: init_vqs: add stat_vq failed
>>>     virtio_balloon: probe of virtio4 failed with error -5
>>>
>> [...]
>> #regzbot ^introduced v5.18..v5.19-rc3
>> #regzbot ignore-activity
> 
> #regzbot introduced 8b4ec69d7e09
> #regzbot monitor
> https://lore.kernel.org/all/20220622012940.21441-1-jasowang@redhat.com/

#regzbot fixed-by: 6a9720576c
#regzbot ignore-activity

For details see:
https://lore.kernel.org/all/CACGkMEu8EECPamY__OqQNf7iuKU7nho_-mij2zWULfV2rV+d7A@mail.gmail.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
