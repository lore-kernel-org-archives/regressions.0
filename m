Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6114A03
	for <regressions@lists.linux.dev>; Tue,  2 Jul 2024 00:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719880433; cv=none; b=MIAfkpojO/+wBz1KRv/0ib5xsAikf9XcXA72zfn17eKsg11405r3J7wQUpPHVLvIvs+6thFbVy+v+f1bkZN0k3n6miq5Xeh7p2ozDVavjSSTcOAPtd6iEXOQ5r3xFlxnb98Isy3c1O915dgWhRWnP+B/pczbxCDlJmFWGnvZ4wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719880433; c=relaxed/simple;
	bh=puwSc/uwxHtVr/n/Fbgth64ZlTW3eNLDkiWw2TqgglA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FGAPcS/jSENwrZ33i4o0Gf1tNTBiwJJjotdXZ8foULCQ/S5NlXdV6kAowPhRjJ5a3kjhrBHJ1C2reI71E5ODuWyCmwT35XAXrsIwCpxC7ftcJlm8su9WXLv06QdlmC/IgaEYakKyiX+wl0xIT4YT1dlZpAOF8nJDhDWNWgpxJ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnUMXkrk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnUMXkrk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42565cdf99cso31890065e9.3
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 17:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719880431; x=1720485231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puwSc/uwxHtVr/n/Fbgth64ZlTW3eNLDkiWw2TqgglA=;
        b=QnUMXkrkoFIVg06PLo+DTAuEi3ngjRqi2qPGwyq7WQb82bikqD8+TNuz+gt0NkIYq5
         m0XaxvGy0Qhke+l1NrbGVoBG2aR1R0KUn100aE5WmB2527NIiryed3zN/wloeFmlUzVa
         x4lJZU9y+KMImqjAk+yJFCCvC1B0soY8gstiFn3vPQ55lSJ15ziKBgoqaJhx+JQJZove
         Yc7HcFYF4lH+QsrtrY0N9s5rMd07RHfeBmy8TiU2JhflE2XdG+t0Jp5TzdQfiL2pjmRI
         +QzkF2OEjcPdOpYk8W9WWb4BMNL++Vo5Jtr+ROG3pGAG7oBw84ceUcKMiyb08k/Qgktq
         2+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719880431; x=1720485231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puwSc/uwxHtVr/n/Fbgth64ZlTW3eNLDkiWw2TqgglA=;
        b=tQjJ9GuEaeID++XtCBt2PMi08ALAXDus1ibU6WMxCXtl389iToXv62VdgNdkePC42B
         aZHhKy/BRlSN1JWPGDn1uhMSTMh56xPmnWBPzeFOtn8LdN2m+95gD2K8IdxVb4uWocyc
         WlQbXKlsAyTmBRs9wVrWCbCRcqeRtlOuZuSVIFRhwaTEXi+fviNwpz+0GSEmwmivIcaB
         KlJq7dX8jCAbnn8IttjPnvcV2BrKF0FRUdLBgE2GntGZ3Q1ZfjF/+wh25pqAgDQatbqh
         2tQsVXTJEzWieh0NsqLo+4HTl38QhqtoPrwT1BM7UzYbI0s6A6TqSMHpsXPkoiDnHrUW
         rPNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpXfQKTjn+bboQ/1bYa1aEzBUv1+TUUMa6kxhNyQ/kULHeVG+IjJ9U+d7nxu2GBgkk3Z39M8ZhxFwa1ZssJNYd4zi6T3tirlbjyAY=
X-Gm-Message-State: AOJu0Yzsx72jBwGk0BwnVwhWZcRPtHX+JbmDiyfVGDosqHtVCvlaNJiZ
	hSB8WhnCBbhm48V3/BwPgDWeDwyHRHjBAajtAz4ngW9ZIkIwZhwc
X-Google-Smtp-Source: AGHT+IGRVjiOMyiN21zj2JUMYkA1mdi3+Ic5d9/fN0c8x7mDnIAq+B/ATBK+3WKMJlHZGi6XHzmopw==
X-Received: by 2002:a05:600c:470a:b0:425:692d:c72d with SMTP id 5b1f17b1804b1-4257a020429mr59651565e9.32.1719880430535;
        Mon, 01 Jul 2024 17:33:50 -0700 (PDT)
Received: from node-04.shui.grid ([31.94.4.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b097c2asm174130515e9.38.2024.07.01.17.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 17:33:50 -0700 (PDT)
From: Builder <yshuiv7@gmail.com>
X-Google-Original-From: Builder <builder@example.org>
To: pedro.falcato@gmail.com
Cc: chengming.zhou@linux.dev,
	christian@heusel.eu,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	nphamcs@gmail.com,
	regressions@lists.linux.dev,
	yosryahmed@google.com
Subject: Re: zswap_writeback_entry crashes in 6.9.5
Date: Tue,  2 Jul 2024 01:33:42 +0100
Message-ID: <20240702003343.2756828-1-builder@example.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
References: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, Jun 30, 2024 at 10:58 AM Pedro Falcato <pedro.falcato@gmail.com> wrote:
>
> Hi everyone,

Hi,

I think I have hit this problem a well. I actually reported this on RedHat's
bug tracker a while back, along with a couple of stack traces:

https://bugzilla.redhat.com/show_bug.cgi?id=2275252

Reverting the commit I mentioned there seems to make this problem go away for
me. This is a long shot, but I am curious if it will also fix the problem for
you.

(Also inserting myself into this thread so I will get updates.)

Regards,
Yuxuan Shui
