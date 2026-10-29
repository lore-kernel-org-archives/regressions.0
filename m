Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256856;
	b=ayOX1eakJltjL2BqDIPdSk2ek5ncwRjaxSzfGHk/BxyTU8GDxUS2uwv3+inyCiPIw3v7
	 Ya7Np8jEF2V5ADwy+Bgr6PjNtcXg2SXVbIjVnEX3/dQOsP0PSgFtjpBs7UOlzRsvlchY1
	 2UBWAOfTE3jP3Pu7Do2j6r0u5ukfSAAkDzwxW6syAKonus8QcPbkpUDeSBAy9iVZ5BXpz
	 HypkVXAUbnmfue7R3rnskcyctjp0JEeG1rswtCFc7z4aWFWizFHl73z4Zteq4S6OVrxlL
	 ykdWT8bHZ/UeBy/g5jjSm007xeBtwBq95RGF3+t14+MV1nRLSrS3tlHzSKRwexmDXrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z0S0sB47V1uB7otfysvwLuTjpySYB+EOjDjMBhrlTMA=;
	b=Luwcy4tbXDxDROGLnNMhMwl56/3xnh7NSS2bKgX+1hJdSezjUuNJonTnHk0AbHXDw5ap
	 5bHxHeqVHahWVU5PHT6/PhVXFBIO7oJdCDepChPfLWAnrHGC24F/G0iPSliaFlDebz/6r
	 ffpkdXEZKe/OffOaTPo6bJe1pdzR3grf9tYMwsDykiZep2mko44OyZWcYqhahQkvXepET
	 Xp7H8mDWUD0H+FFFLHhL5fiZwB30dbc6E3k+d7JtNRvwG9K/qNLRuPNxiGYHHSsFXHZPz
	 LVfjbBmcQYAksoGvSf/eZfLh6lbKhsOXHqVrPwf4j8yDIINl9OBw5xqDfgvpKjDw7cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jx3WG7of;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBDC606A31F
	for <regressions@lists.linux.dev>; Thu, 29 Oct 2026 06:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DBDC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jx3WG7of
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso15108875e9.3
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 23:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793256854; x=1793861654; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0S0sB47V1uB7otfysvwLuTjpySYB+EOjDjMBhrlTMA=;
        b=jx3WG7ofxhJADbk/6OVGbVK/5XbSdo+tUPLncmQxsV5yEcB+DRRSugUDu7BxSI+rdi
         fwlYLg8jJejX7xLUMeUIhvtmAOUBr9qmutfHQiRajJj/fkH7tN3so+3EILMNhm24+q7o
         01I/GAq84nWau9JBesTNNkc3jQU+fmyq12EOOVjwA9MLGaeivGb4vuPtZWTp7SsdFvve
         nwQfuAFZgshygOtIHVVAbo+AhQI0ctux2G44sYxmkkp+fuaQmhXXlpZ6KrhoG8l0ufjl
         zhkiJ0rBLnJ6jEhcUf0RgGN0FgvbOV+q2oWI85s6JWhz0HlygSp+o9seDQXu5//VXf+A
         jP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793256854; x=1793861654;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0S0sB47V1uB7otfysvwLuTjpySYB+EOjDjMBhrlTMA=;
        b=fI5rcfi3wIP++G0JxnXi4d+KYeWxp2vd242eABE6bKdZAyRtzX8Ptvr8kphQVCwv8r
         1sUBygRJpx6yYqMQBybxBGrjAEBvCBaoSBidTaOTOikjKAyUikyOxNDri4FoJ/bd6YVv
         9GlWI9TCy93vNiAydsZ7dW4u81iYJATqBHSyK4N9ZqiKDHf+kYGcbR5Nx8FANJ1PEJPj
         f6bAvsFI8hV237tFVjZ3Cm60lJ28As8wiXigJKLoNFN99+3kCbyb+ND7GFsygQsj5aKn
         c9XRrDchW1m155/QuUOVcnRd97Zhopia023g4xY6eQnQ/Z0iS1Xn2wgTv15dLwdq4KFO
         OQyA==
X-Forwarded-Encrypted: i=1; AKwUvBwIn3S+oMX61xkyV3S+TsF4jHjk83dJx3q97aLhwQMnS7k7aLK+eV/evZ8MtvSGHIi62WPYSGO6DZYrgA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKnCCWHl80MmycggAaCKGwvo9kHQxB0Ng31GXzCgchFEzf77yjB
	lQqBhObDn3iWJ8D13p/EHJUP7u80AHvYuH0nvM/oD2TAkF5tsM2HEsBH
X-Gm-Gg: AYBFou0DDxgIENFk+lC5Fm6DlLeuRMYuUm8OhYvGSA4rBCdUK8aOvgqZpXsdhI/Z4ym
	EDBq7leRQmC5fsbovFVDc1Y6hce5NO1JN7Dygcv+4Jr4k/9H7eejJCRJ20cUVOxv/DlvVLqBPBM
	J0IXPOzxa421OdYlhv+WfbJagX6Q4F3BKzsTEzzdvUaghLO4Un2wTTFcIISeLq1yXzoeXX4T8/y
	KHf2M4e0jgHVGa6+QbIaTK+9U0IP5Il5Y+pGuA6XFGT1ym0Vz8p2MarbEKW/o1SpTtJUaaS/DDE
	4ZSCrtdZYIa/7u8i0VrFUzhRitSKbJT2MMLCSsIqlgWeHqUO3sUioyIbeP64dY2hLDitUTrt1O8
	RjCtxIz12VcA9WK88gVVQgfaK8nYOnyIEAkd2gFMBL/kOMprMvQdyFUjRsbuv0MTTifNOFClqbL
	+ET9mXuQK0qyjQuzZ/Y5EQmpaQiGofu7Rqs4sfOpzizimLUKV7/SMZzBg0CsmePPgHEfbqiXAUI
	iVQjHlf/fDqUX94WiMOqZdN/OOhC9l859Aql9LL6DcBVAA5fmO/9hmIV8+zvu1U566tClgw3fPv
	wdi+Zy1owF3Z569g2gzoXRphmH5ZUECXB0XG/g==
X-Received: by 2002:a05:600c:354f:b0:4a3:2f35:38b4 with SMTP id 5b1f17b1804b1-4a965ec95f6mr105795345e9.10.1793256853891;
        Wed, 28 Oct 2026 23:54:13 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm51260925e9.9.2026.10.28.23.54.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 28 Oct 2026 23:54:13 -0700 (PDT)
Date: Thu, 29 Oct 2026 07:54:09 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: yiyu@yiyuzhou.io, <linux-usb@vger.kernel.org>,
 regressions@lists.linux.dev, diogochaves@me.com, raoxu@uniontech.com,
 dennis@dsine.de, gregkh@linuxfoundation.org
Subject: [PATCH 0/4] Fix problems on disconnected devices in 7.3
Message-ID: <20261029075409.4b203658.michal.pecio@gmail.com>
In-Reply-To: <20261028080734.173da0e4.michal.pecio@gmail.com>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
	<20261027192128.386082-1-mathias.nyman@linux.intel.com>
	<20261028080734.173da0e4.michal.pecio@gmail.com>
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

On Wed, 28 Oct 2026 08:07:34 +0100, Michal Pecio wrote:
> Anyway, I think it all can be done with a bit less code, while also
> handling disconnection during unlink. Particularly on EP0, multiple
> URBs may be submitted by different drivers and/or userspace. Just
> because one of them unlinks its URB doesn't mean that the others are
> aware of anything being wrong and won't stall for <N> seconds.
> 
> This below is a rudimentarily tested RFC but it seems to work. It's
> simple enough that hopefully it might even be correct. I will test it
> more and write a changelog later today if there are no objections.
> 
> I tweaked the logic to return everything with -ESHUTDOWN and not
> bother to assign proper status to the URB which halted. Intuition:
> we want them to give up, not call clear_halt() or reset_device().

Actually, wouldn't this break the "resuscitation" feature? Does anyone
depend on it? Hell knows... I changed to give back the halted URB with
normal status and ended up with similar code as everyone else, but in
different places, so that URBs should also be flushed on unlink now.
Took a little longer than I hoped.

Is the last patch 4/4 necessary in practice? I guess it probably is.

As for disconnection of USB3 NICs from Renesas, that still works
without hanging the HC. In fact, we could even Reset EP and Set Deq
on the interrupt endpoint and nothing happens if it's not restarted,
but these patches here only clean up EP0.

Regards,
Michal
