Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592203;
	b=c0AUVsnhLoKKoQ00lnujG1/+f4CdR80D5GsW+zicAc3G4zk3RccGVygiwBV726Mn30nm
	 wKj+07bfYIoNs0i2P/WmTLkXnBfNknceWTzXWGCSpxZHAxwY2L5bgQuiNTpqrCcrteSb/
	 2vZukYM9l+dMXV/pI2M7T9RfjSI3gLb3PI95ehrrn1mokNLOVEpYpTVX9bKBBNmvjqUN8
	 DBiONCJ5szFOWpkxN+AbEBFXRngnMDmJl/jIROTfrCVfCJM0BnVnjWudrvuzGtiIWEYMj
	 PITJYOv0QBjj5518VRBVgu/vY6ZWxSmCFxgxi2N2vE0OVlVvfqgFep64qnOOp0AZ8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6vw8BFSRQ/2Pr6gEks5F+/0NN1DbpHkowONhrXv+xvA=;
	b=f0wLESv73nIC9y1GIAVwHGHyzPOMkus+zBE7/YcGnADLBdjFVe4G+p5YjMc29Dn4kKQ+
	 /nBMV+kYuC3ePq4uDjQ/MEQvCXfFOkLN9k9kYmsvGC2Q4EUcguXYlFIhp/hKnbLJIhKGh
	 9Jmv/rMTu4fgZsF/VYkmmOkv8qOwMtgMirmw8TG30MsIpLIqazzC/TMI4TKfMSN+++6Vo
	 CgODO94DyNam8ronnkAmFNVn6j9fFs4PTIqLa9hBW7HpdOzRX5zhosnxUDp/VrQRf2Nj3
	 VODklRuREfUD7LNytMoEC9m13c7XpCw/hpIVyHL41ahZOP8S2BrAr9+LW9T3ROo2vJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EcOnQxtR;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24321606A31F
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 14:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24321606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EcOnQxtR
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so9140845e9.3
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592201; x=1793197001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6vw8BFSRQ/2Pr6gEks5F+/0NN1DbpHkowONhrXv+xvA=;
        b=EcOnQxtRc96ShRmJGzcKIPWlormG93trdcjgKomxnn098AqmIDtJg7+yAbuGXPeTAr
         pOeWoBcKauoS19e7cLnT6pfph76j1LtOe/i8OFpqjJJWA/ZXXm2KT4JsQEGUtjQoKOm9
         feJpXj8f6BnJSQ91wbSYzQugqyHJ2HnDe9kdYP8VHLmr3yKbsCYx87QJ+0QYdJIq4+qW
         chgUuDZiMEYa/dc4lY2EL0XuxFoAjKjmVYarUYSADzA+AMshy+FyCRFy7TxcnJbzXCmb
         JPvQLnRM6cFlTd8k1bkbqVpF9e0Jw7BI3sBcshQnUF0XEKJ6j2mBnWPj2VNUK0WmNGhQ
         ScjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592201; x=1793197001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6vw8BFSRQ/2Pr6gEks5F+/0NN1DbpHkowONhrXv+xvA=;
        b=X42sTp7UwQREI+2TuVdh4xkNYNTJvQy4BvEmM44VLB7h9RUO+lLI61nDK3vB1ZWknZ
         6kVHB55WxhqvvpjuEN5AJKTy8x9vxzUTZPqImwlgLefMMW4nDYyVmaRFZLSJwYQzMbcp
         ELSEzNLb4WM4HhHXL4veiKWKpOvi2Nvj59pvzNhxniwcgFY6HOWByIK3bnhin2eF0Hw0
         44+ht5DR6l9+qGVYE3RXSB3il6Vx6DmBN84QTGjNbO1wr590WkOR1+fSj+q5uErFY+xq
         OmmuWhggxKhntCkiqvn6ySDCWC/ncWgMHSAqOJK9Y8dV76QkwfbnvyxQI9IzMRkgm7QE
         Dg6g==
X-Forwarded-Encrypted: i=1; AKwUvByUFjYT5jAyNbFScYKW5dgJW66MSdqtQGYWy97pwltEFnWAoQUNzgaTfq9cbdFuwmyTGDxtv555Cf82Ug==@lists.linux.dev
X-Gm-Message-State: AFq9FYIhUSc6E9fys5u28A9Nf8zH2Hb0lip4DMtiIFt6XN9eden27CNW
	x+hMFxqz3ovm06J3KClRei4FOnynJjxU4ihRzV/vMJ3OX/w5nkJBoDKc
X-Gm-Gg: AYBFou0t40oZW9rxYwzIDmZ1aVkqxJZritiC5hm3tsTqQg6qBygiFTvtnlF/PYkEP1e
	m9fbqf8Qq5GxxcVYiviUddIJoFWPwBSvpZTXfd650HKJTaoHdwETctqj1MsY1os8jnsz7TqDic3
	TfxYdpcAB+YCx0w3BRTGizXoyFwAQENYcsv2cOZJBrUfJ9WvY+FXTfJz9Uo5yIwq+zo5uGx6/Pk
	eoS/EJdX23uJJra/b5HS29YPheglb3oGgjrzFrVjTdYZUAud3MOZjyEggDj/7Kr6oslvRI5cHk8
	ioNrp24YU4okrp4KLvyXa2NLaFA9kBFkQ7NSotxzQgAE23W3IVM372qpU64pWU9AmQQUgSjGzav
	fpuNe6ewZebmwz/y7I+Cykq8r4SRTTRrio6piYvi7SiXfHTkursQIZSu+AyPCksQlx5mNyR1h7e
	NxOL+LGQJIb9YxTdSiKIKqRZqD94xdH03qlNukRv37AR77ONPVcpA6/RLlbem0rVxEG1jOaTiBp
	IGvttN4Xr0knSP0jol/jte69Bj+XQOB7I3D44t9y84jCQ==
X-Received: by 2002:a05:600d:14:b0:4a0:eae0:b30e with SMTP id 5b1f17b1804b1-4a1fdd29c25mr38502685e9.22.1792592200397;
        Wed, 21 Oct 2026 07:16:40 -0700 (PDT)
Received: from fedora ([2.35.202.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb698cebsm117409555e9.1.2026.10.21.07.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:16:39 -0700 (PDT)
From: Francesco Nigro <nigro.fra@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	kan.liang@linux.intel.com,
	leo.yan@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Francesco Nigro <nigro.fra@gmail.com>
Subject: Re: [PATCH] perf test: Add test for events re-armed with PERF_EVENT_IOC_REFRESH
Date: Wed, 21 Oct 2026 16:16:30 +0200
Message-ID: <20261021141630.2408518-1-nigro.fra@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-180295@kernel.org>
References: <sashiko-outbox-180295@kernel.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On systems with Transparent Huge Pages (THP) or multi-size THP (mTHP) set
> to "always" [...] As a result, overflows only reaches 489 (or fewer)
> instead of NR_EVENTS (1000), and count_overflows() returns TEST_FAIL.

Confirmed: on master with transparent_hugepage=always the software case
gets 489 of 1000 overflows. With madvise(MADV_NOHUGEPAGE) on the buffer it
gets all 1000, and the tracepoint case still gets 1. I'll send a v2 with
that change.

Thanks,
Francesco
