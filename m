Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCB0139D10
	for <regressions@lists.linux.dev>; Sun, 14 Jul 2024 20:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720990500; cv=none; b=dt19xydbv8B3SGI+1A6BjL+OZmM52MOznoR9Po3BwmL3irKr9VgJv6BR7XiE9kaHvToLNRylFKIlp0G7tbIoahSnlCP4SptqWFnZzjKXDR761dYu+bw/Wrm9SGAglAeitY2iSXXbbxtQw98PtO72u7OatabCtf9wGf4g5FUj33s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720990500; c=relaxed/simple;
	bh=W1yqfKj+E6sNKafGXp4QFzyomqwKN4BP4CSrNMWT8xg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XzrF5cIOfmDaObLsobPFjiRchkJePJU5IqGFX0NAutlIDrOOUGkyJJQmqKv52gg2yKsksWVNNRmshT+X34ym5nNA01VOFs4HlchayqRhR0PsxBjEMJ41RAVLFvkAvo5aqf3xPtUBxRCKBv+lS0SPGrjMwMFYIvNGZJkzlcLfMfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjuWKqRL; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjuWKqRL"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so41787081fa.1
        for <regressions@lists.linux.dev>; Sun, 14 Jul 2024 13:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720990497; x=1721595297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4v9yh3TKbyCiRcM0Hm0vfZMcOoFanDFliV++pw3Igk=;
        b=GjuWKqRLrzzIp37MGytKEanYjGa4yhu1Q0NcpfyFGAlRUW4vEakt4dhkDVSKPA+gx9
         SBAsJo1x0ch1OqD0kZmYSK4n7ZaX34aOpzlOAH9KHaQn3o63578Lp9pqFx/BROXjSX5G
         LCtGr4ewOfPKytpvjgr1ay74T6fEpYbKUa3mDt6yDOyHY/vL8gkewIDVwFYcnzfoADpx
         Bvgz4ndPbfyHfYz+8zIzMnKkC2kBpIbmkvKeUkTQ/Go2C3Q8p71yGT7Myn2+9zuCcTU7
         jW2fPv82VwTda3ON4lg1nPKLnDljYRe5V2TW/TmgQ1y7OrU5ni3uhDH2vZo5NOftFHlx
         qGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720990497; x=1721595297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X4v9yh3TKbyCiRcM0Hm0vfZMcOoFanDFliV++pw3Igk=;
        b=YlUqWZKjJJ9THxPfHwOzXIhI7YAFru5A8D7A9ngZGqfpRm6MoEt7eKRLVrLp5RbRvu
         QyeZgnqct0+FKfEj2FdX91pJtlijfsQ0oJfY6u61866yS4gjaR17ec+fI9aUCN5cwec5
         nuUXg0efQxSDplS17Zn/SIhIVWlYNLwGti8FCTS0uZu22LJNqfIZ4+hm0wYs6Q4bXPpa
         anCmKZvg1chEESJ0v4I3TUiMknzpIRoc2UR7UKrUXMcoNx8MoponvWDO3dQnHniCPpNY
         Sc32SnEkrj2p/1MxBoEbcyKXbzZ7J5Z4q1WNEjWXSp5HBpBUHAen9MLw/UjmoGtSfAdt
         1POw==
X-Forwarded-Encrypted: i=1; AJvYcCWZMMdYXyPHQKm3mw4ZR+VkKErJEnSA5F9GGw1uw6sW/S/n8xRZieFMg3vdbfDtZD4tsvOa8fmFeaX08OK9Ym33Y7WqaUsSAh8gDCc=
X-Gm-Message-State: AOJu0YxprWsNALqxwNQyYwC+KFiWJf0h/v8pr6sVum6Il1hTctU5W+H0
	GtphrvZgyDVvM6xCoUsNkEF15GioOyRhG/3RwNGwXdYEdirpShxz
X-Google-Smtp-Source: AGHT+IE6umD2PQY9dYePZFeiMEylR7CcDejrl5iUvXUweEKTMdaVp6IvP25oegFRXqF9D7PS4vK9PA==
X-Received: by 2002:a2e:880a:0:b0:2eb:e258:717f with SMTP id 38308e7fff4ca-2eeb318a0ecmr114034771fa.42.1720990496888;
        Sun, 14 Jul 2024 13:54:56 -0700 (PDT)
Received: from foxbook (bip217.neoplus.adsl.tpnet.pl. [83.28.131.217])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-59b24a770cesm2529395a12.19.2024.07.14.13.54.55
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jul 2024 13:54:56 -0700 (PDT)
Date: Sun, 14 Jul 2024 22:54:51 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Tim Lewis <elatllat@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
 niklas.neronin@linux.intel.com, stable@vger.kernel.org,
 regressions@lists.linux.dev, Salvatore Bonaccorso <carnil@debian.org>
Subject: Re: [PATCH 6.1 000/102] 6.1.98-rc1 review
Message-ID: <20240714225451.193914d1@foxbook>
In-Reply-To: <CA+3zgmtwunPaLbKygi0y+XY7XUd2cBGVP8So8MXxK_1pOX3miQ@mail.gmail.com>
References: <CA+3zgmsCgQs_LVV6fOwu3v2t_Vd=C3Wrv9QrbNpsmMq4RD=ZoQ@mail.gmail.com>
	<20240714173043.668756e4@foxbook>
	<ZpP3RU-MKb4pMmZH@eldamar.lan>
	<CA+3zgmtwunPaLbKygi0y+XY7XUd2cBGVP8So8MXxK_1pOX3miQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > Not on 6.1.y:
>     drivers/usb/host/xhci-ring.c:2644:31: error: ~@~Xir~@~Y undeclared
> (first use in this fuunction); did you mean ~@~Xidr~@~Y?
>     2644 |                 inc_deq(xhci, ir->event_ring);
Sorry, I didn't notice that v6.1 is different. You need this instead:

  inc_deq(xhci, xhci->event_ring);

Another refactor interfering with backporting :(
