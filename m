Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0D7C
	for <regressions@lists.linux.dev>; Fri, 19 May 2023 13:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684503971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ooaoDXWiYqNHwpwAlZ5TH2xlrXBySJTTzRpl4impsO0=;
	b=H6277QsXuZTH7AOJ94rhiMfvQ21nObFCq0i8g8bsElt9K93g/TLqeLDJsqjqRKR0cVemOj
	bwfe0KHFAtg7F/V6IbIZGS3qP7bmaImc39jw7iRLpRnkQdokgyeRsX99MR8vkIHpavdZ1m
	1jbZX2Av19flWRZ3RS002/uRleVoJ/g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-OXZL3UodNqeRBb-xQkPkaA-1; Fri, 19 May 2023 09:46:10 -0400
X-MC-Unique: OXZL3UodNqeRBb-xQkPkaA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-510d1c71b8fso3289947a12.2
        for <regressions@lists.linux.dev>; Fri, 19 May 2023 06:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684503969; x=1687095969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooaoDXWiYqNHwpwAlZ5TH2xlrXBySJTTzRpl4impsO0=;
        b=TRkD+cgQhyHoRK1waz/gEGFweRxLTw2kvNRXAfvK6OlLsK7G+QpENnssYZYS+8eXJG
         wzlFXFxD4g/txJW9uiFKohAA87rUg5FEQNZJenMd2LP1SsvbYfgI05iaRWAnpV+C4SWH
         tAG9K8WXU/t8JhbG3K2/WXs7CKlKGRVkWuAG7YGx4McGadMViNlwAQBygTOkFn+CsxI/
         v4xPY61wsJH9AonZf/XTgM8rgXVCXqR+iJOZOEUvCltwW5OhpKYh4owgVsrlvI30DMVM
         Hnc3vK/YT+UR7Cs3eZowORS1sxwfYzpuun+tLlPUE10z5IWH0gS/lygK9d05sGRjLuyl
         L0lw==
X-Gm-Message-State: AC+VfDw/1MglDx5zvdEWz5Fou9EtR/F7blom0waC1JfFIMDk0i+OzdqY
	z2ngvv2HeC8jLB0A9qFAWFHnuEVFaC7BG1vTRgMjXIfEiXp3P0lrm050+gED+zJEeqvAlkAQMYT
	ypJzu02luO2PgkelxqgCE0tE=
X-Received: by 2002:a05:6402:1b0c:b0:50d:ff73:64ef with SMTP id by12-20020a0564021b0c00b0050dff7364efmr1749666edb.20.1684503969776;
        Fri, 19 May 2023 06:46:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kbSpzzRMNk2yhk0jXBgwaJ85kMVYUNGda42rdnEP81KbEsJQBybc1tTyjvhwsxgEOc2a2OA==
X-Received: by 2002:a05:6402:1b0c:b0:50d:ff73:64ef with SMTP id by12-20020a0564021b0c00b0050dff7364efmr1749646edb.20.1684503969445;
        Fri, 19 May 2023 06:46:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m11-20020a50ef0b000000b005067d6b06efsm1681645eds.17.2023.05.19.06.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 06:46:08 -0700 (PDT)
Message-ID: <2d7ee116-5985-021f-0dfb-b0485a465c86@redhat.com>
Date: Fri, 19 May 2023 15:46:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: ThinkPad L540: suspend not working (deep / S3 / standby,
 regression Linux 4.19 -> 6.1)
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Input <linux-input@vger.kernel.org>,
 Linux i2c Devices <linux-i2c@vger.kernel.org>,
 Benjamin Tissoires <btissoir@redhat.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 kolAflash@kolahilft.de
References: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <73883c7d-42db-7ac6-fa43-b9be45cdc795@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

This looks like something for Benjamin Tissoires (who will
be available to look at this in 2 weeks or so) to look at.

Adding Benjamin to the Cc.

In the mean time passing psmouse.synaptics_intertouch=0 on the
kernel commandline should restore the old 4.19 kernel behavior
of simply using the touchpad in ps/2 mode.

Regards,

Hans



On 5/19/23 15:19, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
>> ThinkPad L540 failed suspend deep dmesg output - Linux-6.1.27 from Debian-12
>>
>> Since updating from Linux-4.19 to Linux-6.1.27 suspend deep is not working anymore.
>> (a.k.a. S3, standby or suspend to ram)
>>
>> Notebook: ThinkPad L540 20AU-S00N00
>> OS: Debian-12 "Bookworm" (was Debian-10 "Buster" before)
>> Kernel: Linux-6.1.27 from Debian-12 (was Linux-4.19 from Debian-10 before)
>>
>> Can I provide any other helpful information?
>> Do you need a test with a vanilla Linux-6.1 kernel?
>> Should I perform any other tests or maybe try out boot parameters?
>>
>> Full dmesg output attached.
>> Excerpt:
>> rmi4_f01 rmi4-00.fn01: Failed to write sleep mode: -6.
>> rmi4_f01 rmi4-00.fn01: Suspend failed with code -6.
>> rmi4_physical rmi4-00: Failed to suspend functions: -6
>> rmi4_smbus 0-002c: Failed to suspend device: -6
>> rmi4_smbus 0-002c: PM: dpm_run_callback(): rmi_smb_suspend+0x0/0x40 [rmi_smbus] returns -6
>> rmi4_smbus 0-002c: PM: failed to suspend async: error -6
>> sd 4:0:0:0: [sda] Synchronizing SCSI cache
>> sd 4:0:0:0: [sda] Stopping disk
>> PM: Some devices failed to suspend, or early wake event detected
>> sd 4:0:0:0: [sda] Starting disk
>> OOM killer enabled.
>> Restarting tasks ... 
>> rmi4_physical rmi4-00: rmi_driver_set_irq_bits: Failed to change enabled interrupts!
>> psmouse: probe of serio2 failed with error -1
>>
>>
>>
>> Maybe related:
>>
>> 5.17-rc regression: X1 Carbon touchpad not resumed
>> https://lore.kernel.org/lkml/YgF%2F0QGFN4SppLKg@shikoro/T/
> 
> FYI, I guess the regression is also introduced by 172d931910e1db
> ("i2c: enable async suspend/resume on i2c client devices") and
> should have been fixed by 7b1f781f2d2460 ("Input: psmouse - set up
> dependency between PS/2 and SMBus companions"), but it doesn't
> fix the reporter's issue.
> 
> Anyway, I'm adding this to regzbot:
> 
> #regzbot introduced: v4.19..v6.1 https://bugzilla.kernel.org/show_bug.cgi?id=217462
> #regzbot title: psmouse suspend failed on ThinkPad L540
> 
> Thanks.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217462
> 

