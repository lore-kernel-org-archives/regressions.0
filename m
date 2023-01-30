Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FC0160
	for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 23:09:14 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t7so4313371wrp.5
        for <regressions@lists.linux.dev>; Mon, 30 Jan 2023 15:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nBJSf0ujnLSINj9vtVqCPIJUNHNqvfxIwQaQ2Pf5QPI=;
        b=fXcEGnHpuTMxqjF81LzYGEjxdrRIVQpkK8XSxfBNzkMdookleOEbuAVmp9Z5ZVCotS
         axdeMivX2doj/9+R0+xbQz1Y1nF9wfApIhaw3QTUcBdcDbrHYmxBs1Exl0zeZLk/3DM3
         /uxGpyKWy8DgAJTo4Y8kw8495ulb/GEnvszPW1ranocA8TLjhYyKQ17IdCAdAmQHPFSM
         /CSNJn6eXTvZ71KVMXEWliE05kW9VLLJr8XOYXMnFdECSqrJr49SqN5WEPdU7Ml6FUld
         J32j1DVQ1agb1+2fdR5OQeoAHj+CIZKsiIx23H6y6/lbYHW2bsDA0TCIw8+Qa21nqqZv
         mLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nBJSf0ujnLSINj9vtVqCPIJUNHNqvfxIwQaQ2Pf5QPI=;
        b=3hfhc/2oFq7tzQVHubnSgo9Jfj1VcRLhk3HKbPAmcXefS/HzELHdcWhUDvucNKuoL1
         slYQn2c6OhVv7OqWZN7n5pJONhCznT7knAGFpMTFo06zjLh2PxcWhlGSbXatNwWM2fSQ
         FesmUGLIHqdjSAR81FAhvaDJiKFNAnO+NVtRCPaOhmmx5Qsin3r0VP+SUwO1g51Sk7UH
         i7fYeAEW+GKk59pXxBKCIxZ3JaCvYFofe+Ia+PBsEGs+bPJGujz8KV9sEoPM9czUxoMr
         tg+d9ipj6jqPR7jU3XuN8jvm7iQ5wUZhEGkXARyTnpiIs2hl7t7jFQz6C00KxtvtBXna
         8KoQ==
X-Gm-Message-State: AFqh2krhu7hZMdgfDKOxGZA0D2YZxrdW3pLGrC0WerCZUnj1T196Mooj
	0Gmgth5DnONRmrDHQGrsIWw=
X-Google-Smtp-Source: AMrXdXstvNWA6suGxYdZtreTUdrAXIng9NTIHs6qOi5zxQJ73BED5Zi8z5jOZvFUQJs+vVi5Hs9OsA==
X-Received: by 2002:a5d:6282:0:b0:2bf:9516:d295 with SMTP id k2-20020a5d6282000000b002bf9516d295mr30547069wru.22.1675120153156;
        Mon, 30 Jan 2023 15:09:13 -0800 (PST)
Received: from [192.168.1.10] (97e09f27.skybroadband.com. [151.224.159.39])
        by smtp.googlemail.com with ESMTPSA id g2-20020a5d4882000000b002bdf3809f59sm12707867wrq.38.2023.01.30.15.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 15:09:12 -0800 (PST)
Message-ID: <dab6eb81-db3f-8fa1-84ad-9b40e209514b@googlemail.com>
Date: Mon, 30 Jan 2023 23:09:08 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
From: Chris Clayton <chris2553@googlemail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 bskeggs@redhat.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
 <b21fa1f6-a71d-5657-8596-ee0be73185ea@leemhuis.info>
 <3ab28896-70e9-6f90-5b97-e5397b06e715@googlemail.com>
 <a163dd7b-c5d1-a07b-a816-7a2dfd3edfd4@leemhuis.info>
 <ab1b0f73-6b4e-8602-2999-b7bec25d92db@googlemail.com>
 <CACAvsv4sOtPjCVnEcKd2RCUqYWxSn5XKyksbS-Bds2qCqyusVw@mail.gmail.com>
 <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com>
Content-Language: en-GB
In-Reply-To: <1cdb84ac-f7a8-66ba-98fc-3db302b49a5a@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi again.

On 30/01/2023 20:19, Chris Clayton wrote:
> Thanks, Ben.

<snip>

>> Hey,
>>
>> This is a complete shot-in-the-dark, as I don't see this behaviour on
>> *any* of my boards.  Could you try the attached patch please?
> 
> Unfortunately, the patch made no difference.
> 
> I've been looking at how the graphics on my laptop is set up, and have a bit of a worry about whether the firmware might
> be playing a part in this problem. In order to offload video decoding to the NVidia TU117 GPU, it seems the scrubber
> firmware must be available, but as far as I know,that has not been released by NVidia. To get it to work, I followed
> what ubuntu have done and the scrubber in /lib/firmware/nvidia/tu117/nvdec/ is a symlink to
> ../../tu116/nvdev/scrubber.bin. That, of course, means that some of the firmware loaded is for a different card is being
> loaded. I note that processing related to firmware is being changed in the patch. Might my set up be at the root of my
> problem?
> 
> I'll have a fiddle an see what I can work out.
> 
> Chris
> 
>>
>> Thanks,
>> Ben.
>>
>>>

Well, my fiddling has got my system rebooting and shutting down successfully again. I found that if I delete the symlink
to the scrubber firmware, reboot and shutdown work again. There are however, a number of other files in the tu117
firmware directory tree that that are symlinks to actual files in its tu116 counterpart. So I deleted all of those too.
Unfortunately, the absence of one or more of those symlinks causes Xorg to fail to start. I've reinstated all the links
except scrubber and I now have a system that works as it did until I tried to run a kernel that includes the bad commit
I identified in my bisection. That includes offloading video decoding to the NVidia card, so what ever I read that said
the scrubber firmware was needed seems to have been wrong. I get a new message that (nouveau 0000:01:00.0: fb: VPR
locked, but no scrubber binary!), but, hey, we can't have everything.

If you still want to get to the bottom of this, let me know what you need me to provide and I'll do my best. I suspect
you might want to because there will a n awful lot of Ubuntu-based systems out there with that scrubber.bin symlink in
place. On the other hand,m it could but quite a while before ubuntu are deploying 6.2 or later kernels.

Thanks,

Chris

<snip>
