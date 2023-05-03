Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639A37E4
	for <regressions@lists.linux.dev>; Wed,  3 May 2023 04:40:07 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-24dea6d5ce8so3745577a91.2
        for <regressions@lists.linux.dev>; Tue, 02 May 2023 21:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683088807; x=1685680807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=77tiXpQ2HjbyMiGi98E0ovy9Ioj8cftg4GmqV7//X1I=;
        b=AP6cSbQMwHS6YgLcCIuhbKJsz4vaRSY9hCqhPFEtm1HvvnSf0N2gxnGfZTtZNeb3fM
         TZoK8iW8O8MRog34ymtley4D9V4uy5F6QwMBxbNoC6MOWj60ENUdFc9y3b2u/j6Y1tJz
         hkHjUFD9D/tzIc6oyyld8M2eNwZryMU6ID3HCJ0OIFfHV+sxQAlh5dWP9F6FXA8pt9hW
         qUU8Q1dvEAbAMjCbH6dYmU3dC00Dha/cZMaGdMtWi9pq7ekseqAWr/oQr/shKek35CZ2
         OSNWdXu8oT2IHmDEP+wDrzo+sdwPvFSNLWzCvIF9/pr5vb/SXBHtJnwQNQuLNTNxfiFO
         g40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683088807; x=1685680807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=77tiXpQ2HjbyMiGi98E0ovy9Ioj8cftg4GmqV7//X1I=;
        b=CdcBIF4Em0paL7CXYPb+5feeK/kzIoa06FgrkdXCKb0nDR2FHGbr8uVVJBi34reyP0
         sZy6c43t61olFcJFlazJq63D4Xbce2TotBCMnK7GacA/jXXQXHT/o2ozhc23gsF1mxUm
         6SgUEpcqxDfeg5JomjgSzdvnNGo2a5g8ZSxtWowZ7ncGDbCbt6OC9c1OEh+SnXaeNCCz
         EMRQhPlaxIE5Q78u2+Ipu/YPgxy1nYf1VHvXWb0zD8IcHEKcODW6RzNhSQYxRUMZ5IM2
         qjNADRKVbFb6HikjTUQuzdPNyQ3KGiZQ/DzsYcp3qhHHRIy0o7lqCg+1vBnoufgIkmIs
         ABQA==
X-Gm-Message-State: AC+VfDzgjc0Mczh4Eap/69GsA3+yDWtpPv6Ab36Guqea7w7LjWdH1yXJ
	FTphV9e6hO97OPBHowQOSig=
X-Google-Smtp-Source: ACHHUZ6FVFqaBqyy90CyPDYOpLziIFIxoEYbT12+sSR0gn8lbdxTMRS5XqCfds/MEuQG/S5rDPBXNw==
X-Received: by 2002:a17:90b:4c46:b0:24d:ed1e:c2db with SMTP id np6-20020a17090b4c4600b0024ded1ec2dbmr11210942pjb.31.1683088806739;
        Tue, 02 May 2023 21:40:06 -0700 (PDT)
Received: from [192.168.43.80] (subs32-116-206-28-39.three.co.id. [116.206.28.39])
        by smtp.gmail.com with ESMTPSA id h24-20020a17090a9c1800b00247735d1463sm2276107pjp.39.2023.05.02.21.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 21:40:06 -0700 (PDT)
Message-ID: <b449cbf6-8286-e22d-ca87-b1bc3dce29d7@gmail.com>
Date: Wed, 3 May 2023 11:40:02 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: linux-6.4 alsa sound broken
Content-Language: en-US
To: Jeff Chua <jeff.chua.linux@gmail.com>, Takashi Iwai <tiwai@suse.de>
Cc: lkml <linux-kernel@vger.kernel.org>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Linux ALSA Subsystem Development <alsa-devel@alsa-project.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <CAAJw_ZsbTVd3Es373x_wTNDF7RknGhCD0r+NKUSwAO7HpLAkYA@mail.gmail.com>
 <ZE9B4avbDtIXOu4O@debian.me> <87r0s0pnim.wl-tiwai@suse.de>
 <CAAJw_ZsDdiB=b2PZydQWF2fjSULit3NWE-Bf1icBEryN-GuqUw@mail.gmail.com>
 <87fs8gp0i7.wl-tiwai@suse.de>
 <CAAJw_ZveoPfnBsSkHZqmLiVWATcOosR--6Ds4cdekdi=t1yV7A@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAAJw_ZveoPfnBsSkHZqmLiVWATcOosR--6Ds4cdekdi=t1yV7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/1/23 22:03, Jeff Chua wrote:
>> There was no description about which sound backend is used.  Is it
>> PulseAudio, pipewire or dmix/dsnoop?
> 
> Just pure alsautils.
> 
> arecord -D hw:1,0,0 -f S16_LE -r 48000 recorded.wav
> aplay -D hw:1,1,0 /local/share/sounds/alsa/Side_Right.wav
> 
> [recorded.wav] attached.
> [Side_Right.wav] attached.
> aplay: version 1.2.8 by Jaroslav Kysela <perex@perex.cz>
> arecord: version 1.2.8 by Jaroslav Kysela <perex@perex.cz>
> 
> alsautils, alsaplugins alsalibs all using latest git pull.

Are you sure you build alsa tools straight from the git repo?
Can you also reproduce with latest stable version of these?
Otherwise it's anyone's guess due to moving parts...

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

