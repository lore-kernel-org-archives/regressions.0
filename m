Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D8A6AAE
	for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 19:42:27 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id y3so14826199eda.6
        for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 12:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=j6C9lf7JhzlxE1F6ouy9UeQqCIuaLiW4edqmr70l3os=;
        b=gy/irX4iIF4tgnkELB1IcuP4tGk8YBjcODGsbsYD7RqExJGVHo0bL8amAC7w81Itx8
         OpF7//aWC3ven/odaxRytaZW3ncs7O1Yu47hkFJEsxNY5Z4kL04QnQ89seNTpfsiSHIy
         USuzpUUCp1KxFjMUb6L17sYt1B4yXRFEatTC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=j6C9lf7JhzlxE1F6ouy9UeQqCIuaLiW4edqmr70l3os=;
        b=Jz3np+8uaJKs8vKJe8iQdNlZTUmxuq8mGDRkBU80OtrBJQWOy5kZ+2kPyMAadPPqOQ
         KvcPCQgpTWNOH0ybrxzQ98awDdC8b4pbQ0+nC5gEnMBJQGBm8IERD7+AgaIYFvewHtIc
         jtYLqlL68DinSg44a1eEofI0PvLrwfb3v0d/WLMfUCz2CaXOpiTh/DelZi8KnySNxpGN
         7NJ31VE5LV7Dtu5lTGregFAwUqWjo1lOXHtXlpCscAwSFKRhGYhAnqOPY5pracDif4oI
         NgHlFJPBirPGWCD3Km0Naut89JegwtfH1HGEjHVv1VrT9u4go33KDwMMIaM3otVjsVjI
         qelg==
X-Gm-Message-State: ACgBeo2u5Ug8TfK9LW3JKcFYi/eLiZoY4mwNTAwmTOuumnrLQzIK1kk6
	E8REqX1YE2ZxRL5CuujMXqT0CaSDebuWDj6cNUQ=
X-Google-Smtp-Source: AA6agR4vx9yvK3KHDvXF4DYauf0cgqFeEUi2TdvdYf2HcDjLUewdNclfTCWQYuske57RtSFZ361ROw==
X-Received: by 2002:a05:6402:4392:b0:43e:5033:40f8 with SMTP id o18-20020a056402439200b0043e503340f8mr20395941edc.245.1660678946031;
        Tue, 16 Aug 2022 12:42:26 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id c26-20020a056402101a00b0043bea0a48d0sm8924167edu.22.2022.08.16.12.42.25
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 12:42:25 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id j26so3482201wms.0
        for <regressions@lists.linux.dev>; Tue, 16 Aug 2022 12:42:25 -0700 (PDT)
X-Received: by 2002:a05:600c:657:b0:3a5:e4e6:ee24 with SMTP id
 p23-20020a05600c065700b003a5e4e6ee24mr71425wmm.68.1660678944697; Tue, 16 Aug
 2022 12:42:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv2Wof_Z4j8wGYapzngei_NjtnGUomb7y34h4VDjrQDBA@mail.gmail.com>
 <CAHk-=wj=u9+0kitx6Z=efRDrGVu_OSUieenyK4ih=TFjZdyMYQ@mail.gmail.com> <CA+G9fYuLvTmVbyEpU3vrw58QaWfN=Eg8VdrdRei_jmu2Y2OzOg@mail.gmail.com>
In-Reply-To: <CA+G9fYuLvTmVbyEpU3vrw58QaWfN=Eg8VdrdRei_jmu2Y2OzOg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Aug 2022 12:42:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxpMiMj0M7rvz-zsd4G+LB=kcUrM-3VPTt5EauER4iyA@mail.gmail.com>
Message-ID: <CAHk-=whxpMiMj0M7rvz-zsd4G+LB=kcUrM-3VPTt5EauER4iyA@mail.gmail.com>
Subject: Re: [next] arm64: kernel BUG at fs/inode.c:622 - Internal error: Oops
 - BUG: 0 - pc : clear_inode
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <christian.brauner@ubuntu.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 16, 2022 at 12:39 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> This is a physical hardware db410c device.
> Following VIRTIO configs enabled.

Yeah, it's not enough to just enable the VIRTIO support, it actually
needs to run in a virt environment, and with a hypervisor that gets
confused by the virtio changes.

Plus:

> > Do you see the same issue with plain v6.0-rc1?
>
> Nope. I do not notice reported BUG on v6.0-rc1.

Ok, so definitely not related to the google cloud issue we had in rc1.

               Linus
