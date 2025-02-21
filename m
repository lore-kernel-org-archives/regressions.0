Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1247010E0
	for <regressions@lists.linux.dev>; Fri, 21 Feb 2025 00:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740096619; cv=none; b=irNDCB0yZj+8/EbBekS+eY1DH+Gw+WHCbvnx2Y5gr4j4viJyiTkIf4q/8RQzr1ozqrAqv0f1k9f0jTRzH8K+zXWdnvoO7gYDCkPUxeIP0V+sRwe1H8yBqgrp3Tg6FwHHV20/UwO0Fz1LQW66QPE+XtkpybTFttfgRArzX4zvYKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740096619; c=relaxed/simple;
	bh=vXCYwQLSvKIptQcJVs0ex9tqncT35sXQaqqioY+05h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTnMV0K4c2E7v8JyB4kXbmjI4NFoJqS14TQbaKLtTohiuCZMDJflZh+v3WYUDJFgOrom32hzhXwGW3Vv0ZnudBnBwqYE5drD5FT1lJqsFWkaxQoD3Df+P5ZzsuONoClaHaeciKVfTt5UfqWsPtsJI2vLh9uGQAUfPqaBDKEoSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipsABDyN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipsABDyN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439950a45daso9766855e9.2
        for <regressions@lists.linux.dev>; Thu, 20 Feb 2025 16:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740096616; x=1740701416; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ltM/d0CNg9/b6oyJiIqSMkzVa+3F9bgYF4M2wUIeWo=;
        b=ipsABDyNNUlZAelOHGhFmDQURoLLOkx0IsrSJWBBvIOoZzbtTk6u4AKzIWOeux+B/d
         /6CQzcjNJpaB0RUfUL+mrARieIdLnxK2dfpPLpUjKm4G/fnDHjZ0QU26Y74PJX1lSvPm
         QSg5CYuJYq/sAZFjq7iFPdRp+uHtWmCfsHG6AO3aEqO1gNBp7OHTVWqrdDDn4uvCIjOm
         RiVAi19qeI6plNRGt7HsKUGnzks8jRW7JJ4XFyNua9OD0yT62hAWkKUlkBLbUkFjrBZJ
         uW80zCM5JAVcsAw7khBlT6WvTgmGIfULL3iLG6fgLkYEAV2Am6ivp9VCGhfxxQRb3kGi
         /EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740096616; x=1740701416;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ltM/d0CNg9/b6oyJiIqSMkzVa+3F9bgYF4M2wUIeWo=;
        b=GHEuI1new8VG29w4KdG3YnBeQ+9QvM8Xr4ALB0tP+znLv/uJKJWUa4X9Fx46bJy+fV
         H3KKdr606XbgQaTCEbo20m5ER44SVk60XkmEAcYdGRbyXgRg/JQOPcMkNHhZZt4621dZ
         Y+zSIf5RxWDbT/roxCAz3ng1F6d14CxXU+eYUPUcygMqWfdfWjBkAwg1Qu3FzuqUfPK3
         ssZv/e8rTIIvqZV8gAgWBggh2pSfLFUmjGUtsLrgp9sEwzk1QsRjkE1//vSM0Lup0uAE
         rn7V7pmTtkPJzw9yvFXWRIGzsz/cCvakiq++PUwN5Q3oohaIh1Nlsbv7w55Alm7VlH+r
         qjAw==
X-Forwarded-Encrypted: i=1; AJvYcCXiu/7XsYH40qYagyIHaKEUAnrWxFQ2uV/Z18T4KA2njlWs+AdwUzCoJKhmLKl7VidAJUXEBZz/GtvaPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzU8gwr15XO3ThdfxGya0fijdaQJSqsHSk1yCAKvaM5XdweSUWc
	5nMqTFqTtIiNh0Me6ho1Ur5ZGzM5lpW/BVZirQ7NUzDG1kChEolO
X-Gm-Gg: ASbGncufPJ9fg2PU9ICa98pP65cCDSA8cVTEMGOxDqmuygv4MKQhIt97vMhjJXUVUFB
	h4nXKjWMZ1NayWhIDKShkxDCjnuu1oughVAByqb9+SuGAqG2/SwY2JgRagOCcMQlgcoKFZUkuQ0
	+wHlqK74AW385Y82Sq1wLwRJz0qzRwK57FBhy5KlIWBQRGhekx7JGTQYuqFsCf5y9m3lCjTWhWk
	b4wBkl8TF+haiUw2hSJ3kNPUc3ymVjxHWJNDsDc5McGs+SF6WE0HZziT7YRy+M493wzyOA2Cw9v
	h28OlFaNs+nt
X-Google-Smtp-Source: AGHT+IESXNVFkG0iILEEgotVDpm45DxMQ/ic89gzIihAXdvMHbx/sLissRXUpyAYoKRhDIFHoznvAg==
X-Received: by 2002:a05:600c:510f:b0:439:9898:f18c with SMTP id 5b1f17b1804b1-439ae220a50mr8091265e9.26.1740096616064;
        Thu, 20 Feb 2025 16:10:16 -0800 (PST)
Received: from localhost ([2a02:168:59f0:1:b0ab:dd5e:5c82:86b0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258dab74sm22174894f8f.32.2025.02.20.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 16:10:15 -0800 (PST)
Date: Fri, 21 Feb 2025 01:10:11 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Jared Finder <jared@finder.org>, hanno@hboeck.de
Cc: kees@kernel.org, gnoack@google.com, gregkh@linuxfoundation.org,
	jannh@google.com, jirislaby@kernel.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] tty: Permit some TIOCL_SETSEL modes without
 CAP_SYS_ADMIN
Message-ID: <20250221.0a947528d8f3@gnoack.org>
References: <202501100850.5E4D0A5@keescook>
 <cd83bd96b0b536dd96965329e282122c@finder.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd83bd96b0b536dd96965329e282122c@finder.org>

Hello Jared and Hanno!

On Sat, Feb 08, 2025 at 07:18:22AM -0800, Jared Finder wrote:
> Hi, I'm the original reporter of this regression (noticed because it
> impacted GNU Emacs) and I'm wondering if there's any traction on creating an
> updated patch? This thread appears to have stalled out. I haven't seen any
> reply for three weeks.
> 
>   -- MJF

Jared, can you please confirm whether Emacs works now with this patch
in the kernel?

I am asking this because I realized that the patch had a bug.  We are
erring in the "secure" direction, but not all TIOCL_SELMOUSEREPORT
invocations work without CAP_SYS_ADMIN.

(TIOCL_SELMOUSEREPORT has to be put into the sel_mode field of the
argument struct, and that field looked like an enum to me, but as it
turns out, the TIOCL_SELMOUSEREPORT is 16 and the lower 4 bits of that
integer are used as an additional argument to indicate the mouse
button status and modifier keys.  I had overlooked that the
implementation was doing this.  As a result, TIOCL_SELMOUSEREPORT
works without CAP_SYS_ADMIN, but only if all four lower bits are 0.)

So, I apologize for the oversight.  -- Jared, can you please confirm
whether TIOCL_SELMOUSEREPORT is called directly from Emacs (rather
than from gpm)?  I tried to trace it with perf but could not reproduce
a scenario where Emacs called it.

If this specific selection mode is not needed by Emacs, I think *the
best thing would be to keep it guarded by CAP_SYS_ADMIN, after all*.

As it turns out, the following scenario is possible:

* A root shell invokes malicious program P and changes its UID to a
  less privileged user, but it passes a FD to the TTY.  (Instead of
  UID switch, it can also be a sandboxed program or another way of
  lowering privileges.)
* Program P enables mouse tracking mode by writing "\033[?1000h".
* Program P sends IOCTL TIOCLINUX with TIOCL_SETSEL with
  TIOCL_SELMOUSEREPORT and passes suitable mouse coordinate and button
  press arguments.  As a response, the terminal writes the escape
  sequence \033[MBXY, where B, X and Y are bytes indicating the button
  press mask and the 1-based mouse X and Y coordinates, all added to
  0x20 (space).

It is an obscure scenario and probably requires a console with a
character width and height above 256 (to control the full byte range),
but it seems that this can in principle be used to simulate short
keyboard inputs to programs (like bash) that are not expecting this
old mouse protocol. - This sort of keypress-simulation is exactly why
we created the CAP_SYS_ADMIN restriction for TIOCL_SETSEL in the first
place.

For background on this mouse tracking mechanism, I had to read up on
it myself, but found the following two links helpful:
https://invisible-island.net/xterm/ctlseqs/ctlseqs.html#h3-Normal-tracking-mode
https://www.ibm.com/docs/en/aix/7.2?topic=x-xterm-command#xterm__mouse

(Remark on the side, the GPM client library normally gets its mouse
coordinates through a Unix Domain socket from the GPM daemon. It has
support for this xterm emulation mode as well, but it is only enabled
if $TERM starts with "xterm".)

In summary:

If it is not absolutely needed, I think it would be better to not
permit access to TIOCL_SELMOUSEREPORT after all.  It does not let
attackers simulate keypresses quite as easily as the other features,
but it does let them send such input with more limited control, and it
seems like an unnecessary risk if the feature is not needed by
anything but mouse daemons running as root, such as GPM and
Consolation.

Does this seem reasonable?  (Hanno, do you agree with this
assessment?)  I am by no means an expert in this terminal-mouse
interaction, I am happy to stand corrected if I am wrong here.

–Günther
