Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CC228E1
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 09:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657705423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q57qMhZZqPk/BSCGCLflk0fgjBCLtpUl3ALcakqi8Wk=;
	b=ABPd4MAKptSaH15+DOLE96abfigFY1VcAaivtbLOIS8IsdP3pUF5y0AF9jWxiP6OHVbT65
	Hm6LZZ23UkO6m/2EjW+lyvPw/cKJz9zvT3yUR746Hx+HRJPjaBwbedfXSy/V2yWRziofaX
	TY6xBDMNUAASfXwVPUglQy9augytTzg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-j6i3rkAPPMC9u0gb7n__7Q-1; Wed, 13 Jul 2022 05:43:41 -0400
X-MC-Unique: j6i3rkAPPMC9u0gb7n__7Q-1
Received: by mail-ed1-f71.google.com with SMTP id i9-20020a05640242c900b0043aeffc5cf1so2929117edc.18
        for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 02:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q57qMhZZqPk/BSCGCLflk0fgjBCLtpUl3ALcakqi8Wk=;
        b=3ZeE7xEWTqVl+LQh/XeRLS9zrHM6carLW55w9VCxhFNMCgkyD2qLiEip8sFWXn1I0c
         A09jVn3uE4FqL8SA58LkMlhxyz9RNnH9fJ48SWc6wDVbfgrH+27bsi8ipbl5CdMPd1CB
         3vne47JJfIu+4XyAXsPJp12Mv8BtkbGS5Q2+hlK8z9J4CG64Latj2yOeZtpKkSuQczhD
         PWbgK3v6LAtuTCuhujigJO4J5Bu9jXnXbsOg/Zbf9pIm4P+EKL1QM1PcaDTbVzqkRr/t
         8uhxzw3VO3IWH97IImybEhShkIOt8rgUAccta9UcZIpiyDCrWg7ZCGWXPa9tgwAVVmsS
         FbYA==
X-Gm-Message-State: AJIora92GZkni2jVV/1a1/1ZjRQl7ft5YXOBEoqazYQYSNy2wgmvCRtc
	EHrE6rZuF1RQeZCdhkqtSiYUR3DvjYbvYxMN3MHfO7ILBl/48eq348A4HAA2FCCkUYPyzzi8+VN
	2Y2rS3I4unNDiM5wwZINbILk=
X-Received: by 2002:a17:907:75f1:b0:72b:9e40:c1a9 with SMTP id jz17-20020a17090775f100b0072b9e40c1a9mr1629687ejc.523.1657705419152;
        Wed, 13 Jul 2022 02:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+Z5bMAfaWyqx0jGhRjxuupNcy/Zum1Xqp0A98ijLTZqoxpuYIDweA/zoY6C5/oHGoCejAbg==
X-Received: by 2002:a17:907:75f1:b0:72b:9e40:c1a9 with SMTP id jz17-20020a17090775f100b0072b9e40c1a9mr1629670ejc.523.1657705418890;
        Wed, 13 Jul 2022 02:43:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b0072af6f166c2sm4821546ejc.82.2022.07.13.02.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 02:43:38 -0700 (PDT)
Message-ID: <02190bee-2e1b-bea3-b716-a7c7f5aa2ff0@redhat.com>
Date: Wed, 13 Jul 2022 11:43:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [Regression] ACPI: video: Change how we determine if brightness
 key-presses are handled
To: Ben Greening <bgreening@gmail.com>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, rafael@kernel.org, linux-acpi@vger.kernel.org
References: <CALF=6jEe5G8+r1Wo0vvz4GjNQQhdkLT5p8uCHn6ZXhg4nsOWow@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CALF=6jEe5G8+r1Wo0vvz4GjNQQhdkLT5p8uCHn6ZXhg4nsOWow@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ben,

On 7/13/22 07:27, Ben Greening wrote:
> (resending because of HTML formatting)
> Hi, I'm on Arch Linux and upgraded from kernel 5.18.9.arch1-1 to
> 5.18.10.arch1-1. The brightness keys don't work as well as before.
> Gnome had 20 degrees of brightness, now it's 10, and Xfce went from 10
> to 5. Additionally, on Gnome the brightness keys are a little slow to
> respond and there's a bit of a stutter. Don't know why Xfce doesn't
> stutter, but halving the degrees of brightness for both makes me
> wonder if each press is being counted twice.

Author of the troublesome patch here, sorry that this broke things
for you.

So this sounds like you are getting duplicate key-events reported,
causing the brightness to take 2 steps on each key-press which is
likely also causing the perceived stutter.

This suggests that acpi_video_handles_brightness_key_presses()
was returning true on your system and is now returning false.

Lets confirm this theory, please run either evtest or evemu-record
as root and then record events from the "Video Bus" device and then
press the brightness up/down keys. Press CTRL+C to exit. After this
repeat selecting the "Dell WMI hotkeys" device as input device.

I expect both tests/recordings to show brightness key events with
the troublesome kernel, showing that you are getting duplicate events.

If this is the case then as a workaround you can add:

video.report_key_events=1

to the kernel commandline. This should silence the "Video Bus"
events. Also can you provide the output of:

ls /sys/class/backlight

please?


> Reverting commit 3a0cf7ab8d in acpi_video.c and rebuilding
> 5.18.10.arch1-1 fixed it.

> The laptop is a Dell Inspiron n4010 and I use "acpi_backlight=video"
> to make the brightness keys work. Please let me know if there's any
> hardware info you need.

Note needing to add a commandline argument like this to get things
to work is something which really should always be reported upstream,
so that we can either adjust our heuristics; or add a quirk for your
laptop-model so that things will just work when another user tries
Linux on the same model.

So while at it lets look into fixing this properly to.

When you do not pass anything on the kernel commandline, what
is then the output of:

ls /sys/class/backlight

And for each directory under there, please cd into the dir
and then (as root) do:

cat max_brightness # this gives you the range of this backlight intf.
echo $some-value > brightness

picking some-value in a range of 0-max_brightness, repeating the
echo with different values (e.g. half-range + max) and see if
the screens brightness changes. Please let me know which directories
under /sys/class/backlight result in working backlight control
and which ones do not.

Also what is the output of "ls /sys/class/backlight" when
"acpi_backlight=video" is present on the kernel commandline ?

Regards,

Hans

