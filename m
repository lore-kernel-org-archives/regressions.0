Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5DF1859
	for <regressions@lists.linux.dev>; Wed, 26 Apr 2023 05:46:34 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-38e5eeba43cso2186016b6e.3
        for <regressions@lists.linux.dev>; Tue, 25 Apr 2023 22:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682487994; x=1685079994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=apWq3U9rP6qzNpli2rG6d3Kjm1cpzWGftJ8n/OK8VDs=;
        b=Q3Z3FtAJuXjLB8iH/DUbN/VGWjGEkMUhI8doYpS3e+6mKUr9VSAfThiSmXGkt8YdkK
         7i1ythKaRZ13lRXg8skg6CUdyWqJVitpr0GpZ1BXqBHD9Z4p7iqQhqXzs4thcAHXkVZ+
         siif4FzOQd9WXSc/H4FXB4zIUn5KD6Tb9lPB8/9rWnmWAxO2CdUwZblnc+RxrtV/PBkJ
         pT9GyXquk8c8cgjBChWb7RaWZkIvowNjVDsZRnZYpfcpjBd/8owKbwcvYBkzR6bl/Rse
         pl7hzWayHM3dbsAZgGu0yVRvdXHfPritj1LgLs1+hODZI56V1BgxJxYcwCs5Oi+MzeQx
         J5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682487994; x=1685079994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apWq3U9rP6qzNpli2rG6d3Kjm1cpzWGftJ8n/OK8VDs=;
        b=SIyHonOPY7MpRM/OPz/t9r7iKhxQk5DIkS4upEby3qejFgGvvHyuPNUV7Trup4FobA
         u2l+BK8nc+S3HvlMffNzXGE4yVNkRAWlbkAkdHTRv5nO+tovAzedcCPAzWLa4y+eYQkC
         ufSlOTCNhSEDT4hLMBxacZHs1Xy66AVzO+vrWpSlyBEPpxh9SPu/qRgjdXaBn1x7Yfgo
         PDs4AZBShZALoAJTvQAaXuBRd0TyANzOSGLdwXjwWwowjvRkhre6z5bXvFYGnYpKMbds
         ALXGsNXg6TALjiYAZNbiFm7hIIH/Vzt6pgExzHIl2ONISb4V0nnD1lQRjebpWjQMpALW
         8VkA==
X-Gm-Message-State: AAQBX9e/WGxnxzajFwM5D49zuVgn0bxnq4fgBY8aYNYI5rFtReNt+shN
	Hoaobi9EvoFHIAvxb73+wzY=
X-Google-Smtp-Source: AKy350bNfA1Zb0+GqgjcXX/jQvwjR+EuX0tb6hj9QqT/Um3ML08SQX+aO4Y8z7uD2bbMRyTjBhiOGQ==
X-Received: by 2002:a05:6808:60e:b0:38e:d6a4:69c0 with SMTP id y14-20020a056808060e00b0038ed6a469c0mr4157181oih.13.1682487993736;
        Tue, 25 Apr 2023 22:46:33 -0700 (PDT)
Received: from geday ([2804:7f2:8006:a502:65e3:3fd9:3321:ba17])
        by smtp.gmail.com with ESMTPSA id y23-20020a4a4517000000b0052c27aa1c80sm6878798ooa.46.2023.04.25.22.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:46:33 -0700 (PDT)
Date: Wed, 26 Apr 2023 02:46:47 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jakub Kicinski <kuba@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	regressions@lists.linux.dev
Subject: Re: USB sound card freezes USB after resume from suspend
Message-ID: <ZEi6x155vF5GLeXT@geday>
References: <20230425111924.05cf8b13@kernel.org>
 <87pm7rtdul.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm7rtdul.wl-tiwai@suse.de>

Hello Jakub and Takashi,

On Wed, Apr 26, 2023 at 07:24:50AM +0200, Takashi Iwai wrote:
> On Tue, 25 Apr 2023 20:19:24 +0200,
> Jakub Kicinski wrote:
> > 
> > Hi!
> > 
> > For a few weeks now I can't use any USB devices if I suspend my laptop
> > with my USB sound card active and resuming it without it connected.

Takashi, did you pay attention to the workflow of triggering Jakub's
bug? He suspends the computer with the sound card active, disconnects
the sound card and expects to resume his computer back to an usable
state.

IMHO this is a very believable report and I can see something going
possibly wrong with this workflow. I understand you need the bisection
from Jakub to get a clearer picture, I was just emphasizing the point
that Jakub seems to be disconnecting the USB sound card during suspend
and then resuming, at least that's what I was able to understand.

Thanks,
Geraldo Nascimento

> > 
> > USB worker threads seems to be sitting in:
> > 
> > [<0>] snd_pcm_dev_disconnect+0x1e8/0x280 [snd_pcm]
> > [<0>] snd_device_disconnect_all+0x42/0x80 [snd]
> > [<0>] snd_card_disconnect+0x128/0x290 [snd]
> > [<0>] usb_audio_disconnect+0x11a/0x2c0 [snd_usb_audio]
> > [<0>] usb_unbind_interface+0x8c/0x270
> > [<0>] device_release_driver_internal+0x1b2/0x230
> > [<0>] bus_remove_device+0xd8/0x150
> > [<0>] device_del+0x18b/0x410
> > [<0>] usb_disable_device+0xc6/0x1e0
> > [<0>] usb_disconnect+0xda/0x2c0
> > [<0>] usb_disconnect+0xbf/0x2c0
> > [<0>] usb_disconnect+0xbf/0x2c0
> > [<0>] usb_disconnect+0xbf/0x2c0
> > [<0>] hub_event+0xf01/0x1cd0
> > [<0>] process_one_work+0x1c4/0x3d0
> > [<0>] worker_thread+0x4d/0x380
> > [<0>] kthread+0xe6/0x110
> > [<0>] ret_from_fork+0x29/0x50
> > 
> > Which is:
> > 
> > snd_pcm_dev_disconnect (/usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:818 /usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:812 /usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:1129) snd_pcm
> > 
> > It happens on Fedora 37 and Fedora 38, it seems to have coincided with
> > the 6.2 kernel but I'm not 100% sure.
> > 
> > The USB devices come back after half an hour or so, silently.
> > There's nothing of note in dmesg.
> 
> AFAIK, there has been no similar report, so far.
> 
> Is it a regression?  If yes, could you figure out which kernel version
> starts showing the problem (or at best bisection)?
> 
> 
> thanks,
> 
> Takashi
