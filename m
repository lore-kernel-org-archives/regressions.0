Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795844610;
	b=XspzU0oZKYzEkWVe10Gw5q5RQXKvIBx27SjOIIt1iD3cMbUYvTG5H6duhfqiCS0byrD9
	 i3w1xeh+vH/dQto/XGX4HWtDfLYX9/CJPIDfjkY2RQYRtP+9E3FL181gkK7o0T/CtwwC3
	 kxGxiKvP35CZ7O2JdWueGP6UiMWZiApkphpFfS03rGWnJ9Bo9pYcjKGe3iDuTg2go9oNe
	 UwxQXbcBfFvLogB4xgm+9wdVdQSl6f0bSqY1SOhebWMQma21tvmFnJKfk1P+ARs5WYIpu
	 rIazCA8w1gL8Cg0RU6PAKsQAD510BczwpZkukxdEk7bLW5fhELs6GJdqJXgVobYJmHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795844610;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=vEkdLN0VjxTpHlesa9nDXdjs6TRbBEQBDfO7BJmrmS4=;
	b=EgJY+NRpSd3yGgtYa2yp3W/3R64j1UT7XsxEEX7yW7P34SIg/QwKtXqF+Lvr00+Z0PAr
	 jKTwVMvfFDzVKX4bR1eBJ5GePzyQ/bl6AXslKOY8vyGz9yMtyO6DTBDKVjaiBIPKEyc7w
	 omToci811uhENTKJKAmIGeu0RTi61M+TYGOV1xMSqWU41bEMEf5lJtaHOoeSqlgJMWoKx
	 1W22RrnLXs2dY1Rlcxv7xG0dgaUVRNMRYkX09EuLntCyJDsySjKDnFWQCp3OKhwHoMkbz
	 3ONZsZ3b0ss5Qt4/hg0t9owgi622q0iH7XxYoxOWVL/7+RImJ1NCQeaZ6yAwnpWZ88A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YQqBN31V;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE82B606A31E
	for <regressions@lists.linux.dev>; Sat, 28 Nov 2026 05:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE82B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YQqBN31V
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so71711265e9.3
        for <regressions@lists.linux.dev>; Fri, 27 Nov 2026 21:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795844608; x=1796449408; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEkdLN0VjxTpHlesa9nDXdjs6TRbBEQBDfO7BJmrmS4=;
        b=YQqBN31VXLpbFsAPhQrP1yQK0t53XsTNghqrVQmOeKdVRhvYNpNFynNJxp70j7dVkd
         xTPYK4iHLO3vU837eFwCzgh35Zh6YjBlgnnbCySQzhBA+m1xdo1g3eITyvIE6xnL00T6
         S4nkwIKA35anlS/JRKGhz6O7mUtOEO9Egj63MMrl0tOXaLAInhkoqLtcWQWIcn0e7fL5
         QMwjok5IrzvDEIWUaOAJFZzTlmXWGhkRfwm2mXl2A15cfawysG1+DTr/ovsVUJIpP/00
         zxN25ZgFaXUQSqJMp62cwK+P1vOHBlZWTDiTndZE1hvBTn9IGk2vINv4RCMQNXM2dPz1
         CsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795844608; x=1796449408;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEkdLN0VjxTpHlesa9nDXdjs6TRbBEQBDfO7BJmrmS4=;
        b=DFqT/dIEmIstZY10DnMj++rDNN964yz6xjUEJiQhUeRF3hxUejeTqwNFuCoZzlCtmH
         /N1holHXUGGqL8F7RIYULGuvcQFYSscytcJDq1CEFwmGU6BWUdj+egNfHjGuV+BCA6NF
         aGiwbA7VtaoYUbdyTqnZ3Xy+lSzcvuAnyhVKGV/dPCUXm7YDpCvO3MCqYhcxLfJOvROS
         6pINsU+nj37Ay66zoMr8NRN/6rF/O5mjmvQhydEYTbarljEo0ELtv6JJ28GNyOBmTwhs
         4OXU5zUDlPbg/mL2fpXJY97R2b4yP4UZwW1r5N2F4Mfelj54oie/kUcX316z/H9kpCdL
         wcFQ==
X-Forwarded-Encrypted: i=1; AL+hErFtCbJGhI5Kq7dBX8VUb4bKURB3HGL/FIJOgNmluGzsEyh+txq0vwLX4PfvoK1HXQmGJDiEFp14uBvL2Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9b9fcFuSj8XRQ8q8yWnFIEKOYX419rVAN3iQJ7WjPxK1r5/slv
	RABLK3tFH6K9rDlfFf/LJxNIXUA4O3kJV/389vwCQM2YCC5zOEQ75+ch
X-Gm-Gg: AZFdTZfvCuJ4gFAImyT0TJDxfRjtOrQsnuSwOSOidPFAtuW8BZ9y5YSWRNgQKk8CRlg
	h3jlHZ6jh7/U0C2/pZW8ZdIkyVwAHuDAGtxLOa2DFLZ/VpN6k0fC5fHQeJ9hO9MDN80DTjiQ4Og
	VCSLCjgp4vaPC8d4UxFA4uZwvlsnDLFywAk7oZi97X6rTkIYcZ3ORSb4KLkCgTKIwlldxu0Ggxm
	1L2ByeZkOHnPyAByYAlVvIMWdFMfC14zqF2LwjRxtJ/7mwQJUYL03zLFJo20ochhUrXS0VOE5rd
	T2ildn0GzEAlYd4agAg1jfjqKd+qVYk1GO2pAUUXrSvp1ICn1LiEFMTGoOKDPSomNnjEzhc5knW
	wsEkR/WL5RMl+lCJgRuzgsJ+4PUBfDHs62qTJN4P92n6nxk4WkrA98ZOAV76t1+pkc+/PogwiXP
	YLrCaymPiXcm9ady4We4HQ5j67W7pRcEjTbs0ET+fgI2P3AglG9oxljOu8nmh17Yz9R+ea9lyMq
	9ZcHyXgkLvud52Ei4WT9Z3CuojoDP/p2VrZ/bPjOFtWERbK4qP/IDX/8zNhNIXBhXstzHo/Me94
	xgPh41k62B/ZeIM3exw6C47tNioyjNBdcVZ3Mw==
X-Received: by 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb88826921mr526843535e9.5.1795844608045;
        Fri, 27 Nov 2026 21:43:28 -0800 (PST)
Received: from foxbook (bfj60.neoplus.adsl.tpnet.pl. [83.28.47.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm457333755e9.5.2026.11.27.21.43.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 27 Nov 2026 21:43:27 -0800 (PST)
Date: Sat, 28 Nov 2026 06:43:31 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Flavio Giacchetti <flv.giacchetti@gmail.com>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
Message-ID: <20261128064331.7324a947.michal.pecio@gmail.com>
In-Reply-To: <CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
	<20261125203211.76029bf0.michal.pecio@gmail.com>
	<CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 00:17:40 +0100, Flavio Giacchetti wrote:
> Yes. The earlier Fedora 7.3.3-300.fc45 logs show the X3 enumerating
> at high speed and cdc_acm binding to interface 1 as ttyACM0 without
> the rate-query errors. Audio worked.

I suggest investigating which change in 7.3.4 broke it. And try
upstream releases if possible, becauase no one here konws what code
actually goes into some downstream kernel.

If you got kernel sources from a distro git repository, it probably
still contains tags like v7.3.3, v7.3.4 or v7.4-rc4 created by Greg
K-H and Linus, so simply use them.

> The failure also reproduced with Fedora 7.3.5-300.fc45 and its stock
> USB and ALSA drivers, with a different known-good cable. At 480 Mb/s,
> the X3 disconnected and re-enumerated, then failed to answer USB audio
> sample-rate and mixer requests. On 7.3.4 the same high-speed failure
> also occurred with my experimental cdc-acm module loaded and the ACM
> interface unbound. Please disregard my IGNORE_DEVICE RFC as a fix.
> 
> On the failing 7.3.5 run, the USB hub worker was blocked in
> usb_start_wait_urb -> usb_control_msg -> usb_get_string, called from
> get_term_name during snd_usb_create_mixer. A 30-second usbmon trace
> showed repeated endpoint-0 GET_DESCRIPTOR (string) and class
> control requests. For several requests, the next completion came
> about 5.12 s later with status -2 and zero bytes, consistent with
> cancellation after the timeout. In a separate 7.3.4 run, the Intel
> xHCI driver logged two "Event dma ... not part of TD" messages at
> disconnect.

You should *never* be seeing this message, that's a bug. May or may not
be related to other issues, hard to tell with the information at hand.

My best guess is that some innocent change in cdc-acm (or elsewhere?)
triggers a bug either in your device or in xhci-hcd, possibly related
to the whole disconnection SNAFU in v7.3. (Some of that should be fixed
in 7.4-rc4, not sure if 7.3 series backported it yet).

Did the device disconnect and reconnect on 7.3.3, by the way?

Did you use 7.2.x or earlier with this HW, any difference vs 7.3.3?

> I have not isolated a bad kernel commit or reproduced the issue on
> upstream mainline.

Officially, kernel.org only takess report of upstream kernel bugs.
People will often make exceptions when the bug's cause is clear and
reasonably believed to exist in upstream too, but this doesn't seem
to be one of those cases.

Regards,
Michal
