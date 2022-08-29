Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FE32CA8
	for <regressions@lists.linux.dev>; Mon, 29 Aug 2022 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661767891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiDEAc36fw1oVBz2RndBdLuRw9KgMIJyJTG6rMfsFiE=;
	b=PzU2TQVvFPvSO9HNXEL/ln2rwSzIV6jfN0MhjQiIiiEJDy8XwOzSk+b4VYW3kKWpM8u7nz
	gD07736G64Q+Fgwq9YT5e9YnzqFVfqdIHwXCcuUtEufadkx0lh6sOhfE9G4sAum+tf07/+
	q7TONg9U0qhPziMUhI4tz42BU8/dARQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-QETacIf8N9aFzWpcG1wrAw-1; Mon, 29 Aug 2022 06:11:29 -0400
X-MC-Unique: QETacIf8N9aFzWpcG1wrAw-1
Received: by mail-ej1-f71.google.com with SMTP id gs35-20020a1709072d2300b00730e14fd76eso2101704ejc.15
        for <regressions@lists.linux.dev>; Mon, 29 Aug 2022 03:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=uiDEAc36fw1oVBz2RndBdLuRw9KgMIJyJTG6rMfsFiE=;
        b=DTnQIgJuXzHy259j/WiuXVOiJ9hxvwhqVfdSp2M45xXjGtVEg77ZGdvZdBKtN/4Mq9
         mDmYQQBqd5y1ZQH4f7AUHUN28eApfdKf8NzNlBo/klh0h8mbPUasx0d3caadV+YFu7bt
         ToXbcYbMwcuqF5t61KL02Fi9/Y8CmWBizwX32oIdsKj8SbIRqkLNQglLJpS4eLgx2EHy
         v/opFnjkAaunqkdrG9oul21g3T/HQvoRZWjWe9RgUsVSql/FO8431q6Hz4mVDlncEw3C
         0AAkhfmB2eam3k2jwO61NvuzdvTzyatXlACIxMi3ANTuYCvC6i/Xe36FyAzooJaYrJ2v
         hd2Q==
X-Gm-Message-State: ACgBeo0tYwm+x2HZ3StJ7eYExw6hWRNZWFqU4eJYa8pv0Bya4t9ZZJuf
	bbev4HQ1dPyCBA1uTUGhS2QU6AdU0gjAz4kTVJIk/PWiJG6jHp3YO+LatL9KNF+jDIYVQ1Zo3Ny
	HqgclcBEjU+tFoD+/mbLQgJM=
X-Received: by 2002:a17:906:2245:b0:715:7c81:e39d with SMTP id 5-20020a170906224500b007157c81e39dmr13664983ejr.262.1661767888270;
        Mon, 29 Aug 2022 03:11:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7M4/S/C3JxMIdV9wlV0VL4SAYsK3Ou30eFFHKFVgyE7NH7Ngn2CoK/Tp7ioWQhcY8xIdoyxw==
X-Received: by 2002:a17:906:2245:b0:715:7c81:e39d with SMTP id 5-20020a170906224500b007157c81e39dmr13664973ejr.262.1661767888059;
        Mon, 29 Aug 2022 03:11:28 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ec14-20020a0564020d4e00b004483a543794sm3054189edb.96.2022.08.29.03.11.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 03:11:27 -0700 (PDT)
Message-ID: <ad157199-5127-ba77-e127-61b5de88fb60@redhat.com>
Date: Mon, 29 Aug 2022 12:11:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: 6.0 tty regression, NULL pointer deref in flush_to_ldisc
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <4b4bba5d-d291-d9fa-8382-cdc197b7ed35@redhat.com>
 <e8d67c78-751e-2c44-edff-e7e441c3302d@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e8d67c78-751e-2c44-edff-e7e441c3302d@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/29/22 11:36, Ilpo Järvinen wrote:
> On Mon, 29 Aug 2022, Hans de Goede wrote:
> 
>> Hi All,
>>
>> This weekend I noticed that on various Bay Trail based systems which have
>> their bluetooth HCI connected over an uart (using hci_uart driver /
>> using the drivers/tty/serial bus) there is a NULL pointer deref in
>> flush_to_ldisc, see below for the full backtrace.
>>
>> I *suspect* that this is caused by commit 6bb6fa6908eb
>> ("tty: Implement lookahead to process XON/XOFF timely").
>>
>> I can cleanly revert this by reverting the following commits:
>>
>> ab24a01b2765 ("tty: Add closing marker into comment in tty_ldisc.h")
>> 65534736d9a5 ("tty: Use flow-control char function on closing path")
>> 6bb6fa6908eb ("tty: Implement lookahead to process XON/XOFF timely")
>>
>> ATM I don't have one of the affected systems handy. I will give
>> a 6.0-rc3 kernel with these 3 commits reverted a try tonight (CEST)
>> and I'll let you know the results.
>>
>> Note I can NOT confirm yet that these reverts fix things, so please
>> don't revert anything yet. I just wanted to give people a headsup
>> about this issue.
>>
>> Also maybe we can fix the new lookahead code instead of reverting.
>> I would be happy to add a patch adding some debugging prints the
>> systems run fine after the backtrace as long as I don't suspend them
>> so gathering logs is easy.
> 
> I guess this will help:
> 
> https://lore.kernel.org/linux-kernel/20220818115026.2237893-1-vincent.whitchurch@axis.com/

Ah, yes that indeed looks like it should help. I'll give that a try tonight
and report back the result.

Regards,

Hans

