Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314283;
	b=iQdTwjVr1JBKEHJa0oS1lsyjXR2PyHM/HTiKPgIFnjqITraAM2jq7JU8Zd8fwtinMrdu
	 g1drOnyhM/FJNPdXBzGigE9bDlDbzy1k5BQ53vAaeGiPux5FHOGMQfinIoQF3Ic0C+rBd
	 W7plbXrj/J1WT13y6PF7USWhQ8qcQJINOjFMPdgA/wgV/AioH2sZEPH6/9TJ+Z4AHTuwr
	 zz+EzfVQBkiN2swDkpSTFU5EnAUN/Xr11eLWzCXDDVS7v90beSjZTMXXQ+Ao2iAPyRsR+
	 uDxvgt7t/nARyIbVjT2aupzrKHjPNzWk7IXxN5a7Nr5ZWW+BtDh3sUKZwn6PmiG0Rbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
	b=AvkTaW98h1PvKutuSY3/ACUyBog42geGstVqtvuTZdPdUqOCkhHEZiFvy4xLQYo4L5WY
	 uTfSUNIVd6lwAqO4t43qqiMIeeY9dINU3mR+OK9AXeul62U55IM7FStYEVDSVaBF33eF5
	 D88Pcz7XMmLF7EFYoFTMBseUM3HFpc1xJrP9yuoIzutJqvWjnb089ptsanc6yMiRCExgU
	 ChiykojsofMvh2rUlb9mtUNfNu2QhFPZvcgv4s9mZfOTgxvWmhUM2n9L8hCeU7aII2VVF
	 tpfxeIr/5U9Sin42LpQIeI4H0nDjJO6csL/T/ZiIDV6A23T+ou3WcLeS6skbhyeXmFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=metarealtyinc.ca;
	spf=pass smtp.mailfrom=metarealtyinc.ca;
	dkim=pass header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=AF9GdpaR;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E004E606A325
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 12:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E004E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=AF9GdpaR
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2ee9e7093so628003137.1
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 04:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc.ca; s=google; t=1794314281; x=1794919081; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
        b=AF9GdpaRwtUAmWAa+HjW3eM7G1DxuyjIwo/JUaUNp/D3M7xjpSZim64VtT6jqijl3m
         JYFHk64O50oKqrXX/ua1AeMAFaCDQ/o11efc42d6RBAdZ9RgfPp1UdSVUB83RzaNphD6
         Dtq2lYcobbxL8/4O2gecr4iMF5qbkiZ6/Iynv7uw7z2YIRzb0mLtTvLnU63YI79D4bYk
         BRrre7qj9oJ750oSeecUkRPh20UOM3jVGjWzN4UF/YYFk4KsRtRxmlq28cAqFTRXJoIT
         hOpY4XCc1PtU6R83ntBhwR4W1HRMiokKp+i5tBBc+ZnS0ftK2jZVXWw58M9TaLeZG0wg
         hKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314281; x=1794919081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIqybWUTQzegIEfoVn3a6+qxGy8XVtvbVV2ymuSqRgc=;
        b=BsdkfAVWQJ81tmKw90yxcOeA1C5PJ/AjSZzTXySHTDkzgSGnIkYQBjGiHtRlLv2fRl
         rwyOdh7YEBILvR4nUfA/HHVv+2suRecsNFbwGdHEFqZQ+xpPqMzVfuP3VUIqEwFRtq5/
         9juKffbeeeI6kTTG6zvOKUTda4gR2XnZ12nlKLcyo9kNRlm6O5E3BoUOpjuCpNG0MxzR
         wdD84CS5wSkCRGDBrNveywpamnFSCQp7O+e02H9v7R8c+YuD58FLPSJ9SuOUH8lL8VnN
         h7jaz+YSyS0P8vUSVAsnG/QDxTz7V3ZuLBQ26ic2lfND5tVT7fj0OphfFfjqrbXuBYCR
         B4+g==
X-Forwarded-Encrypted: i=1; AL+hErFB55U0kLE0/CFJK9TJJpNA+oLpyRhfOq8qIbCeiyyCvoaulyAiC9zV2jZArNLSHMKQHUpqAAzbueGHCg==@lists.linux.dev
X-Gm-Message-State: APuU4Z92lAHgGlPu1AFm16k3RH29lMjXRe7r33RweAMoj2JqeQ81cf3n
	3Coemt9hO/r73k4lo7+Hf9+5We1x8G7ZdnRrU3yuQO691FV6pQGQpHjKQtjXflgplrQ=
X-Gm-Gg: AYBFou1QwUTaTS1L9ovP50J9DI2uFeWyx283ryXfgn2ZWgOkrUm2v9Oi4A/6Ix9kY3X
	7NT47HG6N3rgwMuMfPw/K51KZPODE1GbCAcj8kxojaZkyslRe8B9A9gtQQ8OFtEc98auMNILlaS
	sGAkAN/SKDjwd4X5CzBpSGxKZYpkmfCe/3HDkgzT8QLmt38a6ZtD3YluoBiVTb9aHoYUqk4Z1EC
	WkEFQWTM4QS06vPXP7HI3+YyEk0NStTqgujHwOs5ZsUs5Gvt7oAjNB4fbufvF7zZo6+asKLHbsI
	nfd7hHNjuzik6EDkqJM/kYC9J6YfAq5I1YlmHNSOabWydTkgSIOzFyp0Z2Ke/TS13XXny+xBlpz
	qzOQ80PKwd1GBOpCBn3FvQ6I6E6bJL0W1DbzTuCmQB+sD/lsUjC6aQzdbTpE9DZubn4KuciBYnE
	qc7yxw0MVjzMqtsD+izJjw+Oo3UH8Hakq9rvnmujMroRr1doDeWMm4PIiSgn6a5tcZYyRJyee9C
	kwkQLIGXdBLjI9su+Tr1RHH2gMnZnps43grfrazZV47vMSyLGUYWg/cv2bkQs37I3gowCAlxbz+
	/GW7CGkd4po1igds8pSb1+0QpD7xStTtc27Loc3SHsutQCFyVXYMmJygUAALKhA8VKUJsNtGXrf
	hbhqpDGDAtMnc/24bKR8nnDYBEpRqtISJgl2BScmFbgaqqkyy6Ji2sXy3kogc8DdH2DDq5zoavi
	b0BGtSeH5Ob5Roj4F4AZiZIovMIzzdR0vClIBFmrYEAXASrbUII5rD1+I7bIkTkoj1
X-Received: by 2002:a05:6102:94c:b0:7c3:9b8d:5124 with SMTP id ada2fe7eead31-7d301ba5407mr716189137.18.1794314280680;
        Tue, 10 Nov 2026 04:38:00 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::879a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d30209ff97sm1658194137.0.2026.11.10.04.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:37:59 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: arpith99@gmail.com
Cc: sakari.ailus@linux.intel.com,
	gvozdoder@gmail.com,
	lixu.zhang@intel.com,
	mchehab@kernel.org,
	antti.laakso@linux.intel.com,
	mehdi.djait@linux.intel.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] media: ivsc: csi: Add sensor node in bound callback
Date: Tue, 10 Nov 2026 07:37:57 -0500
Message-ID: <20261110123757.730188-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103200226.100989-1-arpith99@gmail.com>
References: <20261103200226.100989-1-arpith99@gmail.com>
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

(Resending, my first copy had a broken Cc list.)

Sorry about this, the HM1092 ipu-bridge entry went in ahead of the
driver. The change matches the CVS fix and looks right to me.

Reviewed-by: Jake Steinman <j@metarealtyinc.ca>

Sergey's VCM point probably still holds: a VCM instantiated by
ipu-bridge only gets its node from .complete(). Sakari, if you'd rather
not rely on per-bridge fixes until the hm1092 driver lands, I'm fine
with reverting 4fdb0342f05e.

Jake
