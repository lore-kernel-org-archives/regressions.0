Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D782882C5
	for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 21:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644833; cv=none; b=LOfnZnALkrNCB9vwmekRo/d/tdcMZidaWXnZszSWd2jKOFGelfSpUXNyrtmipOIG2Q26iTnmO50wxmgq42iKbqY2AbLUlpnPtjvMHoMOFlPWhdwefOJzVXekFOMPDDg94HhIwHPJ4skzaa5bwUJpCWg7b0Ska1i3dZ6QRvzG2/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644833; c=relaxed/simple;
	bh=wapozlZ15SwnLYwG2dp/kT2sgJSViUjoDMIJaS/HsFg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ub6owIyGEv7T5KskHt+rAUd2ba4Acatwx0Js6ao9J732CNqcJGCgatlSIkQwx1kx+6v6f9QxIHfcRhvzFQg6R09/k2pBMknAo39e8Zf1MNlAylZZDBaxuUe+YqscsSeOGY7mUGMMvzMlIneIJzSel6nGz+09/7SnNBH1lYX68lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mEaH9wAM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mEaH9wAM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso63146005e9.2
        for <regressions@lists.linux.dev>; Tue, 16 Jun 2026 14:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781644831; x=1782249631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0MLk7EFjFyUhInKOQGFIRVTa7n3SV8FUkqmtHf663Y=;
        b=mEaH9wAMi/XkbyCHgn8SSu+r/iHPER7b1SO4Ntt3lKChtTsNOps4pkoLCqU9+zsjN3
         0ryeYRUWJ9TXCpB9bVdMiG3rn7wLJ/n6LCbIoYO+6V01PPgoA+iHGNzUvY9bPy2JCTim
         QiEdLy4BrewirKdyvJGm6ByDQWhVYkeu+VP8ZLueLA5U67MbJaPH7ofYPWRoSLEBPA8+
         cJKRBmujpZGX3NOHOs22teNLrIvhk5bWS50QPjg+6IcgeqlIsOkcXhn+4H2UAxApplWR
         aI+fmX2fT9qtu0+YJuK198iRhcCxf2jDQVmCJ9sPNgri1BBCyk77lBKuM2+XkzwxIvAz
         LVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644831; x=1782249631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g0MLk7EFjFyUhInKOQGFIRVTa7n3SV8FUkqmtHf663Y=;
        b=HTuANd49tsb62CNhYnlbNYKChUNmKDnAK66ImxwTZLL+L3l0ftIiZAFC9vdSdMTxTz
         r5TzqnjwmV6AN2byLZ0YB7NDGQ9SnG0TSKDt0GJh4yBr7OUvzy6+IzbVO5kwwgXiTuVb
         p3MaiIfi+i/UWohZicuuXtoTjC6ozkG/uOVLzCbXrQa/+Q6zajwOibyesjQDz/mwGC/c
         r9XSl62bBqnClKyxLdfF5KayyOMu3NpzerKDZKpa7WcKgUlUfBqxtCIIEyCb3h8f3iSW
         CySFwCR/xPoHGYnhENZe/KY0JhlcyphEV//uI7SUDLL2uLUziMUX0+o43diFL2Dy7eWY
         WWXw==
X-Forwarded-Encrypted: i=1; AFNElJ95EnV8vehfwRrZnOMZUdzC0Uu+XhOhEIv+1a4/fxBCmvyEYer+/7zKmSoOGoaZ4KRRjlEppQ7U7vzGAg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxA7NxdC3M1vbllry9ZXdbtGd2WLXK8IWlwIWqML0QgtTOV8SrL
	57aGZamgi1D/MPjgF+UugkTSUnZp4keUtKBQE7Pq9hmxA6+eVn0NPrtW
X-Gm-Gg: Acq92OFlWyy0/3strTCfaBisv3eORY3qEyd38rHnDft0x3v9Y/rpb7zx+zPAv1dNFpq
	bNjh30sCJp0lT49s0c/RGZrPThYmn5lW80+8wDGF8yXtjzpCsJsCud4aPrt0drMEBqe/AbG0w6R
	yyCY3L2TWC+vhxJ2iMiG0orAk2CK48izsrIFA1RVuTWB5ni7YyyaWbdiih47bt2L+CWvN9f1ycC
	tqqBPhdxQc7+InPdWohxfw+kcn3bJnTUkbLLq00nckSuQLZ+PGJ8DtjPX/uhUz+xj7adEE3y4+G
	kQGpBhrdGfwf2HPol4S6j7usKampx44Z5zG8i5LZjmbaL09zIo1sL9JCF1PkiW03dUHSFbK10F2
	IVwDiuOI+1yb8YaBksoewZq2hYPQ2zQtLOc61tR+Gv0C+3GRm5zhe3MTx4A1cYuCDNdKDADg3mr
	zIUp7sjHqBkIMVBAw7LzxHNmJI4phwHpmn
X-Received: by 2002:a05:600c:e548:20b0:490:e5c1:b8c0 with SMTP id 5b1f17b1804b1-492333a1565mr13531725e9.5.1781644830555;
        Tue, 16 Jun 2026 14:20:30 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619fb12edbsm10569658f8f.17.2026.06.16.14.20.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jun 2026 14:20:30 -0700 (PDT)
Date: Tue, 16 Jun 2026 23:20:27 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Amin Vakil <info@aminvakil.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>, Tao Xue <xuetao09@huawei.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: core: interrupt-IN wBytesPerInterval fixup
 (727d045d064b) breaks RTL8153 in Lenovo dock
Message-ID: <20260616232027.10ba0415.michal.pecio@gmail.com>
In-Reply-To: <8f862eb6-adfb-43a9-b4f5-8f9232333b51@aminvakil.com>
References: <cbdeb118-58c7-48a7-94a0-15e5cdb5879c@aminvakil.com>
	<35d2b455-382e-470e-acf4-1ab60770da90@leemhuis.info>
	<5036fee2-4d00-4ca0-aeed-400da64d7872@aminvakil.com>
	<573bbb08-0ba7-4f00-8996-819cc1d9cc48@aminvakil.com>
	<20260616183646.4798516b.michal.pecio@gmail.com>
	<8f862eb6-adfb-43a9-b4f5-8f9232333b51@aminvakil.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Jun 2026 20:22:19 +0330, Amin Vakil wrote:
> On 6/16/26 8:06 PM, Michal Pecio wrote:
> > RTL8153 was one of the chips specifically targeted by this fix, but
> > it affects the CDC configuration which you don't seem to be using.
> > 
> > I have tried linux-hardened-7.0.12.hardened1-1-x86_64 from Arch repo
> > as well as my own build of 7.1-rc6, and my RTL8153 (0bda:8153) in a
> > different kind of USB-C dock still works with a few xHCI controllers.
> > 
> > So it's some weird problem narrowly specific to your system. Now that
> > you have built your own kernel, please also revert the suspect patch
> > to verify if that's really it.  
> 
> Honestly I've tried patching it myself :)
> 
> by changing
> 
> (le16_to_cpu(desc->wBytesPerInterval) < usb_endpoint_maxp(&ep->desc) &&
> 
> to
> 
> (le16_to_cpu(desc->wBytesPerInterval) == 0 &&
> 
> in line 187 of drivers/usb/core/config.c to see if that fixes the issue 
> and it did not, but I didn't specifically reverted the commit to see if 
> that fixes the issue.

This should be enough to prevent overriding wBytesPerInterval on
RTL8153 (and get rid of the new log message).

If the message goes away but the device still doesn't work, the problem
must be somewhere else.

I would start with userspace - if you haven't already, downgrade to
some kernel package which worked in the past. See if it still works.
Or check if 9ddb9c0deca48d2c2a22ebf4d2f35c925a520328 applies to your
dock and try reverting it if it does.

Otherwise, no idea, besides git-bisect I guess.

Regards,
Michal
