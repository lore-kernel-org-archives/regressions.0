Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83CB4689
	for <regressions@lists.linux.dev>; Tue,  4 Jul 2023 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688459411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMe050D13WY1uaScFpdas/d0b3mrsdGbmrzs7inJNzM=;
	b=h7owGOlDL29tHv4PWMhcVqd9PboLu7EJhsLZpOf0eRCLMw5OSc4+qzODKJIjL4ABQULq6+
	EBezIGM1WtNxg69vaFeVc9CS/6vB5XUOULg1TlX8ep3Cm26IEh90FaPt9U8c17GvnRG7cZ
	jrDmSLoNCMFif6iOsAX3hsfUQojy/kQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-QotC_BiFMIS74HneRG3HIQ-1; Tue, 04 Jul 2023 04:30:10 -0400
X-MC-Unique: QotC_BiFMIS74HneRG3HIQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-988907e1b15so448742266b.3
        for <regressions@lists.linux.dev>; Tue, 04 Jul 2023 01:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688459409; x=1691051409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jMe050D13WY1uaScFpdas/d0b3mrsdGbmrzs7inJNzM=;
        b=YXi/gEo0lOm/Q/cOJThYhIfeDa3iDszv4Bh6p31xWtC5SZ2ucd3AwIiua9qNJdsFWF
         TZBurliQqzMf9lQsF14P80CbACdMVzjhdw4RztWLOOC97rElcxNTeilcslPfxWqN6fRQ
         znct4cE3hgg2i0jA44WQsIIv5LRDCI66273pkXP/kNiGcWWrRhSxQ+IlETObMdL43JwR
         KsHpK4t4GnFBammC3om3vSqpM3ezZhYqH4lW1eHq+Iq1PfVZdkRc7PO/mFaDOUFKnjjU
         CSLxi9RcE2jbrAv/Mb576ceE6sRphZ0fgvosfG24trAeSe36FfKlmcwWGZ7zf6O+k+RG
         Lf7w==
X-Gm-Message-State: ABy/qLZkShc3U7NJmJSu2fhiFmwPr+j2mnk9udG600PO7+AikzoUudRp
	frx3yY1kJ32TnBqCFzj+pSydKdFrTaV/LzGFhsorDI8Lsn9yLaB7TbTQ5LOidJTjh4YUNvamgSB
	hrfHlfuj0oBO7wvypSNTxYJzPJh6b5z4WA8BfXAVVvTX4NuckEXR2AFu9I4NAWWTzH+YYApxn7D
	oO069aSTM=
X-Received: by 2002:a17:906:11c9:b0:982:b920:daad with SMTP id o9-20020a17090611c900b00982b920daadmr10024613eja.71.1688459409197;
        Tue, 04 Jul 2023 01:30:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4T2NP2N2wePSULvVTtY5otoNRZ6cofVmW9Hdstaf4NxGERyuE+FFQWYbB4oXDXP0hRnE2f1A==
X-Received: by 2002:a17:906:11c9:b0:982:b920:daad with SMTP id o9-20020a17090611c900b00982b920daadmr10024557eja.71.1688459408771;
        Tue, 04 Jul 2023 01:30:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l16-20020a1709065a9000b00988be3c1d87sm13006895ejq.116.2023.07.04.01.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 01:30:08 -0700 (PDT)
Message-ID: <c2cc745a-22f0-90df-59b0-2abd961cd829@redhat.com>
Date: Tue, 4 Jul 2023 10:30:06 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] mm: disable CONFIG_PER_VMA_LOCK by default until its
 fixed
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: jirislaby@kernel.org, jacobly.alt@gmail.com,
 holger@applied-asynchrony.com, michel@lespinasse.org, jglisse@google.com,
 mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
 mgorman@techsingularity.net, dave@stgolabs.net, willy@infradead.org,
 liam.howlett@oracle.com, peterz@infradead.org, ldufour@linux.ibm.com,
 paulmck@kernel.org, mingo@redhat.com, will@kernel.org, luto@kernel.org,
 songliubraving@fb.com, peterx@redhat.com, david@redhat.com,
 dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de,
 kent.overstreet@linux.dev, punit.agrawal@bytedance.com, lstoakes@gmail.com,
 peterjung1337@gmail.com, rientjes@google.com, chriscli@google.com,
 axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
 rppt@kernel.org, jannh@google.com, shakeelb@google.com, tatashin@google.com,
 edumazet@google.com, gthelen@google.com, linux-mm@kvack.org
References: <20230703182150.2193578-1-surenb@google.com>
 <a88973a0-2646-68cb-5536-532075222fef@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a88973a0-2646-68cb-5536-532075222fef@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/4/23 10:12, Linux regression tracking (Thorsten Leemhuis) wrote:
> [CCing the regression list]
> 
> On 03.07.23 20:21, Suren Baghdasaryan wrote:
>> A memory corruption was reported in [1] with bisection pointing to the
>> patch [2] enabling per-VMA locks for x86.
>> Disable per-VMA locks config to prevent this issue while the problem is
>> being investigated. This is expected to be a temporary measure.
> 
> I have to wonder: is disabling by default sufficient here? Sure, it's a
> new feature, so once this change is merged and backported to 6.4.y it's
> not regression for anyone that will do the jump from older kernels to
> 6.4.y and run oldconfig.
> 
> But how about those that did the jump already or will do so before the
> fix is backported (it's possible that Arch Linux and openSUSE Tumblweed
> do this; and there is a certain chance that Fedora already has
> CONFIG_PER_VMA_LOCK enabled in their 6.4 configs, too)? This sounds to
> me like many of those will have CONFIG_PER_VMA_LOCK enabled in their
> configs now. And unless I'm missing something switching the default
> won't turn it off next time they run make oldconfig -- or will it? So
> for them the regression won't be fixed (unless they fiddle manually with
> their configuration, but they shouldn't do so to fix a regression).
> 
> Or is my logic mistaken somewhere?

Your logic is correct I just tried Suren's patch with my local tree and
it did not change a thing.

If you have an existing .config this patch does nothing.

Regards,

Hans





> 
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=217624
> 
> Side note: that should be a proper Link: or Closes: tag as described in
> Documentation/process/submitting-patches.rst or
> Documentation/process/5.Posting.rst -- and it should be close to the
> Reported-by: tag (checkpatch.pl should have mentioned that).
> 
> E.g. like this:
> 
>> [2] https://lore.kernel.org/all/20230227173632.3292573-30-surenb@google.com
>>
>> Reported-by: Jiri Slaby <jirislaby@kernel.org>
> Closes:
> https://lore.kernel.org/lkml/dbdef34c-3a07-5951-e1ae-e9c6e3cdf51b@kernel.org/
>> Reported-by: Jacob Young <jacobly.alt@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217624 [1]
>> Fixes: 0bff0aaea03e ("x86/mm: try VMA lock-based page fault handling first")
>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> 
>> [...]
> 
> Ciao, Thorsten
> 

