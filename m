Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432FE36B
	for <regressions@lists.linux.dev>; Sat, 18 Mar 2023 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679158172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iYLPi961rrhMuWDEVxQoLmOJ4qh13a023msrkQ97CyQ=;
	b=eMq2JpTnP9BEa8eX0oAJgwhCKi9Zo2zpg6fVCsyc6F3K+xbe7ChDhKf8Fv9H/Rg5ycgpfs
	XmcQCkncyCIfvK4VpDUeIN6m3+z399dDCs7vBlh1pf66wA2R19HePKBrpi7sKX1KfffFhF
	WdbJPZkZzJGjv3Hjee4kPC1+StFy9O4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-q42r90DRPMKk1O8NljAPPQ-1; Sat, 18 Mar 2023 12:49:30 -0400
X-MC-Unique: q42r90DRPMKk1O8NljAPPQ-1
Received: by mail-ed1-f70.google.com with SMTP id a27-20020a50c31b000000b0050047ecf4bfso5678679edb.19
        for <regressions@lists.linux.dev>; Sat, 18 Mar 2023 09:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679158169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYLPi961rrhMuWDEVxQoLmOJ4qh13a023msrkQ97CyQ=;
        b=rML/HlC2bo3Hvx7X02iidQ3w+lzwf5krKQxOWRBPYfHrTB9evFrQR0R1DVSth5/NNg
         VuNqyy4g6uma32g0VjBDmkLQX6l4y4ZHy/WEfDtnwHlXCt7RDy2x2BDy5cAMvdWxSc5+
         NR4XbTrGtDvxP5IdCMC5ovIaX0VpjTfYQ5tNMiszjVa7J7HvcYue00YTCh1phoVU7T1h
         JuqIBnIzNRVqp2WxVbTA2K5fzdGJ3rkW8sUl/Af63o67d+J7BNCxSI/YnbBwGYdiRMug
         EsUh+JVB9wyY4mwS8S1VLB8WiwR6h27bXb49VTGTkm1Qw0NgkmcemLxxwEdwED4TX53i
         e0Wg==
X-Gm-Message-State: AO0yUKWjnsWPh9VoIkoZ+gOZU9VBVQnmEXWW48qiY4Qm6qarWbjmV99Q
	E3n9S1G41Lz680zzP0nGq/H7MMWXLHjlnhCA9UOGowY2PkFB2J6vrqN29YpU+/0BsamWEeYc90Y
	V9Fdjplm659H8sTliD7B4nocMsABRVug=
X-Received: by 2002:aa7:c90f:0:b0:4fc:687a:c29d with SMTP id b15-20020aa7c90f000000b004fc687ac29dmr6847323edt.1.1679158169289;
        Sat, 18 Mar 2023 09:49:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set82X+r0HM83cSH5tYRr+jo2nTQ//vjM+T3XwYju9aqTznKPN6KcewIP3GtDMriqb/zd1kr+Kg==
X-Received: by 2002:aa7:c90f:0:b0:4fc:687a:c29d with SMTP id b15-20020aa7c90f000000b004fc687ac29dmr6847313edt.1.1679158169062;
        Sat, 18 Mar 2023 09:49:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v6-20020a50d086000000b004fb00831851sm2537072edd.66.2023.03.18.09.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 09:49:28 -0700 (PDT)
Message-ID: <09d1ba06-a034-165d-2f7d-fba7d379e026@redhat.com>
Date: Sat, 18 Mar 2023 17:49:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [REGRESSION] Missing nouveau backlight control on 6.2.x kernel
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <87wn3f8zj7.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87wn3f8zj7.wl-tiwai@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Takashi,

On 3/17/23 11:04, Takashi Iwai wrote:
> Hi,
> 
> we've received a regression report on openSUSE Bugzilla about the
> missing backlight control of nouveau device:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1209296
> 
> On 6.1, with acpi_video=native option, the system provided
> /sys/class/backlight/nv_backlight entry.
> 
> On 6.2, with acpi_video=native option, there is no entry in
> /sys/class/backlight.  And without acpi_video option, it falls back to
> /sys/class/backlight/acpi_video0, which doesn't work as expected.
> 
> Hans, could you check whether the recent change in video_detect.c (or
> anything else) may influence on this?  My gut feeling is that the
> culprit could be rather some change in nouveau (so dri-devel is
> Cc'ed), but I'm not entirely sure...

As I already told the reporter, who first contacted me by private email about this, all the drivers/acpi/video_detect.c changes which may influence this are also present in 6.1.y (IIRC >= 6.1.5) . So since this is being reported as only happening with 6.2.y I don't think the recent backlight detect rework is involved.

And even if the recent backlight detect rework were involved, specifying acpi_backlight=native on the kernel commandline (as the reporter was doing before) should still work since it overrides all other backlight detection.

So yes this seems to be a nouveau bug and should probably be reported following the instructions from: https://nouveau.freedesktop.org/Bugs.html  (which I havealso told the reporter already).

Regards,

Hans



