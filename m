Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC0320F
	for <regressions@lists.linux.dev>; Fri, 13 Jan 2023 20:38:54 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j16-20020a05600c1c1000b003d9ef8c274bso13845243wms.0
        for <regressions@lists.linux.dev>; Fri, 13 Jan 2023 12:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Fvw7CEXfWs4BNOotSNKzL7lfGrSU83NLzzvdSmfbnE=;
        b=CTnLqZ1fH+fEdsSdiJU0d5bNYSidoh9EXQRUISnCP3i+h+Vulx3s0mr6l1ZlhFsKwH
         od6dcYrHtQjTHu5Vvd/JPiksqoe4VnbskICvU9v9z7vEEDpZYS40fZVuGeFQVxjzZ3SY
         qLD/oxdNJ6L8U9HgB+rf2rIovfNe0ykyOMJ6cJUrn30nNRTJtm5tMA9oswbgVtdyc4Jv
         wnL2QokSPS7JL92czzeEbF1gr0VNHscLsF1RqVBq88h1wMCsYWEZJwPMj31DuyiuOKQp
         6xiFjDyNv652VaBk2v2jrJr61btVS8om0UlsS/xtE5NZajmF5L9vV1sbDLY3TiZQDrIP
         EeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Fvw7CEXfWs4BNOotSNKzL7lfGrSU83NLzzvdSmfbnE=;
        b=7YXa6DZZCXoCneTXufi726rDzLJWzUhs+dgx3AnNvHdOOo7EoQOTF/6W3TJqyINB2f
         pP3A4aTBbZxx0y36asDGI0gqxcSmEuI2ssDP78iYenDIwFuVUV9Po37IAV50ThjwAA5t
         Wanzu8xLLIxd8l0raqE69Pa+KDnydHad+3JSqRTMPSjtePNop9GwZ3wbVZ8QpQQ3m4xy
         DKQVX8a4H9YoFXsag8EZDI/iFKQ0A0zBtC7y1L9dH+tdzQIozEe5MXq5lj4NllwHuF4y
         hqvl2zgOG1hjQR7KaKTRhlJpl2VgszfHXfTs1P/6o5N/KIytm5E+WralZcgH4JleYRc4
         JxNg==
X-Gm-Message-State: AFqh2kosMqoEUAjFjUBP0SB74SQHRHictiqm0ofACDO2rIvsLeu3H9JI
	j9Vtg32I3BkGXnVpIFjEoNH8X4yLY98eRQ==
X-Google-Smtp-Source: AMrXdXv7TdEq0cy1zsLE1S/ABC1Eq0MnjdS6DKmFYPeZSf+/pixQTnXsGukj9Bm5JDzMHVsayapk6Q==
X-Received: by 2002:a05:600c:4d23:b0:3da:270b:ba6b with SMTP id u35-20020a05600c4d2300b003da270bba6bmr1946443wmp.41.1673642332265;
        Fri, 13 Jan 2023 12:38:52 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id o15-20020a5d62cf000000b002bbedd60a9asm14125306wrv.77.2023.01.13.12.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 12:38:51 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 8BAD2BE2DE0; Fri, 13 Jan 2023 21:38:50 +0100 (CET)
Date: Fri, 13 Jan 2023 21:38:50 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: Regression bisected: drm/display/dp_mst: Move all payload info
 into the atomic state #forregzbot
Message-ID: <Y8HBWgieidOo4S1c@eldamar.lan>
References: <ghwn827862.fsf@gouders.net>
 <45ca4839-fa2a-9511-fd47-2d75fa3766cd@leemhuis.info>
 <038cecb9-aab2-bcd7-f003-46ca637942d8@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <038cecb9-aab2-bcd7-f003-46ca637942d8@leemhuis.info>

hi Thorsten,

On Wed, Nov 23, 2022 at 04:43:41PM +0100, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
> 
> On 13.11.22 10:28, Thorsten Leemhuis wrote:
> > On 10.11.22 23:32, Dirk Gouders wrote:
> >>
> >> I noticed a regression with Linus' current tree and bisected it to
> >> 4d07b0bc403403 (drm/display/dp_mst: Move all payload info into the atomic state):
> >>
> >> I have two monitors connected to my laptop's USB-C port and since this
> >> patch, one of the monitors remains dark.
> >>
> >> Please let me know if I can provide additional information that could help
> >> to investigate this problem.
> > 
> > Thanks for the report. To be sure below issue doesn't fall through the
> > cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> > tracking bot:
> > 
> > #regzbot introduced 4d07b0bc403403 ^
> > https://gitlab.freedesktop.org/drm/amd/-/issues/2171
> > #regzbot title drm: amdgpu: No payload for [MST PORT:0000000006da5d29]
> > found in mst state 00000000b0e556d6" on system resume with TBT dock
> > connected.
> > #regzbot ignore-activity
> 
> #regzbot fixed-by: d60b82aa

I have a question on this regression tracking, as I noticed the
https://gitlab.freedesktop.org/drm/amd/-/issues/2171 issue which is
still open, does not appear on
https://linux-regtracking.leemhuis.info/regzbot/mainline/ :

Is the fixed-by marking above correct? There is still ongoing
discussion and Mario Limoncello is proposing to revert commit
4d07b0bc403403438d9cf88450506240c5faf92f . Cf.
https://gitlab.freedesktop.org/drm/amd/-/issues/2171#note_1722420 and
https://patchwork.freedesktop.org/patch/518080/ .

So is it needed to to unmark it as fixed or do I miss something here?

Regards,
Salvatore
