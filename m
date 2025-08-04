Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6376C28AAE3
	for <regressions@lists.linux.dev>; Mon,  4 Aug 2025 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754326456; cv=none; b=hQZckjXxoBXE3Vrw7WBXEa4yYoXW/drcjjyT5Tq6J32ffHvtzfOcnSO4/lkxFYwnDron2QyYl4JDQHb7C5FLZQmHreX9Tj9Wjrn8hadCsRASng1O5ZLyr30AC3chVnEQ1O/PJvAIFXFDs9ByuW2PluJz4jQi4kNvNFccCRcoQYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754326456; c=relaxed/simple;
	bh=RJQzgzVZ9sfL06y59Z8cjqtnnLIQ3KwQk8KSi2+egV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DL06O3Y3BrnIdOupNiyAocd8166j1iEHbAKlBJJmA+jQMq1IanxlNXd//G+VWHSNaymlg0dduJ8rpKaHvQE752NBTNRfuPIEKaPgp45XogaM8yWodWkLzme8e6n2LQa/T5yxWNXkVysZHzMFmN1yPS36w1vAurHhrcVQwwDZqNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=15Kot3Ve; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="15Kot3Ve"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7e6696eb4bfso349612085a.2
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1754326453; x=1754931253; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJQzgzVZ9sfL06y59Z8cjqtnnLIQ3KwQk8KSi2+egV0=;
        b=15Kot3Ve8B2AYF1gU6qM+EjFb7n4w7xDbbZaKWf6TGzTQjIZQ3o8ZlaTiElcsAIDNk
         S77xo6SuMrU1piJEiJEbWhlazVdVhMDjedXhqt1++b5sUJM1yWLAQB3tpqbtbpNfWa6A
         Z8/G+6c2B+3wBo+fAmBc7524eOhnzWmnVDOcpfUMYn/ovsVa2m3CjL73gS/J6wJknzVb
         FK24VHm/xag/90Icib6MoTauV0glcbbYpb1GFqMutAqBDWHkG9NbTauxAAAv4MyVaAwM
         BqP8LplwBAyBDa1kn917ByKXC3L/rUqd/DQ+29vMCe2Tg5VOIv0Zzr99DPBxL4FfKrhX
         0J/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754326453; x=1754931253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJQzgzVZ9sfL06y59Z8cjqtnnLIQ3KwQk8KSi2+egV0=;
        b=Y18+8SZbAkHBGTYseA3vrn4kUbHW7iB9bD8FcK215RlT25rzQyRG696/ZmSqfRUp0/
         X3JFqEWNDghgP3HkIMp9ogHPJPpLP0YMbiB0/9qrYtGie8v0AheyFC9jZfA5ZRD+WQKW
         qogu0qfW4Es5sMulDMlLIokPzfTXuwNR9BTb/eXX8SXct7o/+P3NeCcz08oadXngG+NP
         leSucA5oewewpC0LsHGG790K+psPv5aFUqBe5n+VAuhTAuG+tACgNtxmceQyGVhvUADe
         dsDsx/MP9OkGZxe5Lh5y+8t/NxJRQmwoLySWy38c4nsQBJEaup2uwGHQnnzAac8zZkfZ
         rMxA==
X-Forwarded-Encrypted: i=1; AJvYcCXyW4YAdrFoI7QB1zRXa6d9F5uwpYCMn2S6PgKmaJNeOvt0yX2CY8HQS4ij877zzK/ffp5yQL8SH8+ddg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKPRAYiYBlE80LLZnn/KuFFIkD4Dmd6xfrnSn6unnpPSrZwtgj
	YCmcjiAOp9fgilYhhkJ1epwezaKbZT7Nn4yenSwVquyABzeg6YueQ1szVwZM2kjA59w=
X-Gm-Gg: ASbGncsmAac8Ecb7V8qCE7gG0fdgKDlXcakwqPyDW2Hp8lTr+y+TZXnzXYSnwqEiGxZ
	WEsoO4MvPdzZOALkiSZN4Nsdd3dXs/3SHxjTMYTv3xggh2s1r1wBHrfOFNCQKA291Ia3EboCdHP
	+F4+Vj+wQBkGgTXW58PiaYiGrX+pY7QwMMO1e0+LuQyxSlgmDBxEC/2o8cdNFPOynZKbA/QbCyD
	OE2GYz+sS5796S2dw5UeNub1lDgeWoOQmUwQ6YDZPmWmGpixH8T9ZWlsVJRG9fgnv1j8TcZLq0B
	RwQRg2Trl4VC3lLghuHvdU9eP+uPJNKPMXN6KQB0tJOp4lIMrNQ3j/Q92+HFL9fzJ2LUtDKipEL
	+T5ppxw8cBCvzL58AgsGmgQ==
X-Google-Smtp-Source: AGHT+IEvwQQo0DtQbm/3RHBFvHstOPE43gzFFtVI+ZE4T2j6bzMLuHT3WUOzF7nHRzWlYq+Hof2k8w==
X-Received: by 2002:a05:620a:408a:b0:7e6:3153:e9d7 with SMTP id af79cd13be357-7e696267b98mr1382150085a.6.1754326453037;
        Mon, 04 Aug 2025 09:54:13 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7e67f5c30ffsm568655785a.33.2025.08.04.09.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 09:54:12 -0700 (PDT)
Date: Mon, 4 Aug 2025 12:54:08 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: linux-kernel@vger.kernel.org, surenb@google.com, bsegall@google.com,
	dietmar.eggemann@arm.com, mingo@redhat.com, juri.lelli@redhat.com,
	mgorman@suse.de, peterz@infradead.org, rostedt@goodmis.org,
	vschneid@redhat.com, vincent.guittot@linaro.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] intermittent psi_avgs_work soft lockup
Message-ID: <20250804165408.GB1303466@cmpxchg.org>
References: <aI_fUhpBrIBrJ073@debian.local>
 <20250804133240.GA1303466@cmpxchg.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804133240.GA1303466@cmpxchg.org>

On Mon, Aug 04, 2025 at 09:32:45AM -0400, Johannes Weiner wrote:
> We probably want Cc: stable on this patch now that 6.16 is released.

Nevermind, this didn't go into v6.16. The v6.16-rc6 tags made it look
like it did.
