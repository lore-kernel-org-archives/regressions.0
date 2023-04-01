Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB0B8F66
	for <regressions@lists.linux.dev>; Sat,  1 Apr 2023 21:17:53 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id y35so15420127pgl.4
        for <regressions@lists.linux.dev>; Sat, 01 Apr 2023 14:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680383872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/aUE8x/14V3dMRPOVnDZcdRoITdGNMwL8Z4JZeeVb6o=;
        b=P/2/vp/3V0LdJykPEDiqSME92a2SeIhnYBtj97hIgQFYmbRS68KrRXlFlMX7odtq7x
         OfWyne4G1yIXlxT67x+qJIFot3WQ+pYHpXLiwxTzzRpjUkmjoXV+ev7b1+AqWzNpY8Aq
         HcTuT7NjohhI3SmwKqFzaKK6DLBZ8m7BF+r9lSVEQm5x0f/Gz0bccd7gBUsL6qAwwBXH
         oxO6L7pDblZ5RlzBh2NJXCsAvc0UW/aivyCU5lysg7JA43XRQ5kKwlz/1DVL+U6cQ7Gf
         lQo0nxxR87Lx2y+8MgoiLFVer4tvD734MkiKT7YtfDigEIslStRDkRJSnalUF1eeojPT
         F2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680383872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aUE8x/14V3dMRPOVnDZcdRoITdGNMwL8Z4JZeeVb6o=;
        b=YGOJeyYNn5lJbAcM1zppt/DUdYygUW+otHy8VXLwqrXbAz26BdLpl3VMSLSDPbCP4+
         7MzxlVtbuzO+OJSxkpOs8/fmcfaiFoINE85hQgH2uAZd8lioqRkdIlqyoHDdTuoUFCSQ
         UhIhq3hqBSHWAjNYXjiOOtjo+zG4g1yfi4U3qfDJ+fvKfQ0ltB9NfYI5dKymYKJLMDoK
         ADxkPlCTL6LUf44bthOXbVmZthjxooTV+wjNK0+FzQtdG5PxY/+FZpU1w2ha/C6IxwMt
         c5ONI0a08K0TYksL6P0DMeDxLGtT58vWfM5TMFoTNPQe+gOVrkGQ/GyYCpgFAabrhNLm
         HCMA==
X-Gm-Message-State: AAQBX9d5OBmHIZgDZDgb/hLXVvTTrQA5AlT8fhPk5YMQsY9e40VnE2rW
	Hqc/YWDBIkqfvS2iGBKNAMs=
X-Google-Smtp-Source: AKy350ZZExF6wfrtRs0ucXe/UzYvAeirB6CVbO2KXFgKqMQGm8wugfaaSVhCuN8bWUzTIVtidyDXqw==
X-Received: by 2002:a62:1948:0:b0:627:f740:51f9 with SMTP id 69-20020a621948000000b00627f74051f9mr14529387pfz.3.1680383872349;
        Sat, 01 Apr 2023 14:17:52 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ac04:c59e:2de:5791])
        by smtp.gmail.com with ESMTPSA id y1-20020a056a001c8100b005a90f2cce30sm3970890pfw.49.2023.04.01.14.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 14:17:51 -0700 (PDT)
Date: Sat, 1 Apr 2023 14:17:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	regressions@lists.linux.dev, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] wrong coord from Thinkpad TrackPoint since 6.2
 kernel
Message-ID: <ZCiffEmTSi7aynk5@google.com>
References: <87h6u4otuc.wl-tiwai@suse.de>
 <3dec29bf-b772-d82d-fff9-6c8bcca5f464@redhat.com>
 <874jq3q52i.wl-tiwai@suse.de>
 <87mt3umyui.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mt3umyui.wl-tiwai@suse.de>

On Thu, Mar 30, 2023 at 10:23:49AM +0200, Takashi Iwai wrote:
> On Wed, 29 Mar 2023 11:28:53 +0200,
> Takashi Iwai wrote:
> > 
> > On Wed, 29 Mar 2023 11:22:18 +0200,
> > Hans de Goede wrote:
> > > 
> > > Hi Takashi,
> > > 
> > > On 3/29/23 10:16, Takashi Iwai wrote:
> > > > Hi,
> > > > 
> > > > we've received a bug report about Thinkpad TrackPoint (ALPS DualPoint
> > > > Stick) on 6.2 kernel:
> > > >   https://bugzilla.opensuse.org/show_bug.cgi?id=1209805
> > > > 
> > > > The device reports the wrong values as the movements, e.g. sometimes a
> > > > value such as 255, 254 or -255 is returned while usually it should be
> > > > a smaller value like -1 or 2.
> > > > 
> > > > The evtest on 6.2.x kernel shows the wrong values like:
> > > > 
> > > > Event: time 1680037542.898747, type 2 (EV_REL), code 0 (REL_X), value 255
> > > > Event: time 1680037542.898747, -------------- SYN_REPORT ------------
> > > > Event: time 1680037543.145196, type 2 (EV_REL), code 0 (REL_X), value 1
> > > > Event: time 1680037543.145196, -------------- SYN_REPORT ------------
> > > > Event: time 1680037543.175087, type 2 (EV_REL), code 1 (REL_Y), value -255
> > > > Event: time 1680037543.175087, -------------- SYN_REPORT ------------
> > > > Event: time 1680037543.185421, type 2 (EV_REL), code 0 (REL_X), value 1
> > > > Event: time 1680037543.185421, type 2 (EV_REL), code 1 (REL_Y), value -255
> > > > Event: time 1680037543.185421, -------------- SYN_REPORT ------------
> > > > 
> > > > while 6.1.x kernel shows the correct values like:
> > > > 
> > > > Event: time 1680037386.318058, type 2 (EV_REL), code 0 (REL_X), value -1
> > > > Event: time 1680037386.318058, type 2 (EV_REL), code 1 (REL_Y), value -1
> > > > Event: time 1680037386.318058, -------------- SYN_REPORT ------------
> > > > Event: time 1680037386.328087, type 2 (EV_REL), code 0 (REL_X), value -1
> > > > Event: time 1680037386.328087, type 2 (EV_REL), code 1 (REL_Y), value -1
> > > > Event: time 1680037386.328087, -------------- SYN_REPORT ------------
> > > > Event: time 1680037386.338046, type 2 (EV_REL), code 0 (REL_X), value -1
> > > > Event: time 1680037386.338046, type 2 (EV_REL), code 1 (REL_Y), value -2
> > > > Event: time 1680037386.338046, -------------- SYN_REPORT ------------
> > > >   
> > > > I couldn't see any relevant changes in alps.c between those versions,
> > > > so this is likely a breakage in a lower layer.
> > > > 
> > > > Could you guys take a look?
> > > 
> > > I believe this is caused by the kernel now using -funsigned-char
> > > everywhere and this should be fixed by this commit:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?h=for-linus&id=754ff5060daf5a1cf4474eff9b4edeb6c17ef7ab
> > 
> > Ah, that makes sense!
> > 
> > I'll build a test kernel with this fix and ask the reporter for
> > testing.
> 
> And it's confirmed that the commit above fixes the problem indeed.

Sorry for sitting on this, I just sent a pull request and it was merged.

Thanks.

-- 
Dmitry
