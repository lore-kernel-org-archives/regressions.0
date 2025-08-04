Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0891235364
	for <regressions@lists.linux.dev>; Mon,  4 Aug 2025 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754346879; cv=none; b=pDaJHiMnrB1bdhnr1WBgO85vitoo3NTAa8Rjxp7SImj7eCEsMtvEXbfkq0OjcG+5OwFIuIDn7DSxF+Pyh519T7EuaFo89cECfMkkJ0reqjBvCXB+VIy8w1SjKaTcVE847aJlXkKZ+kytOZGcOsJrE9GDmDbT16HTSiRH+KjNkZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754346879; c=relaxed/simple;
	bh=jLqHuEkPoyPdegSoer1lnw1IVig1L4050MNMgQHpMcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=py/kEfg+MIVddfOp6ovzCvU++UCbZ4an/nFCIBCLYyNjnOsTqjJlYPnFCBdpvRR+tYdksx2kcETKyyHnGUfBIlmsJKrdUZIeNabepmKGwE57XZ52OAzN7SRxmf+siPskS8SXKqLil36FrSUgvOhmo0E7W8crfNY4kGi2oZR4Vdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOVhFvR2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOVhFvR2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b7892609a5so3213495f8f.1
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 15:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754346876; x=1754951676; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOe+oseDiKDWnydBzNUnhpGVuR6PDQg1TJ9zx0VvakQ=;
        b=NOVhFvR2y9QYpm6iqykcwXNhFpQoJAM3TXhZuPaZDW3rol2+Z6LPJgpGKM9iORLcPl
         VWNkDo/o5Nz+qlh8Zcw9Mk9as6VhCTUTSPzMWCdulb2vaW61emY2Jh5pCRzQ74Yxe/LK
         626s/jsovjc3D1KPvVYaVbRU26G4RR9CvuJbdOy+XWlHsOgBl+LDKiy6AQjTDEMwCSCW
         WQ4HCLdxhQAbcWmUbFqavORKgaDIqOGgmjoSomnDMXDf3UJyUe7+aGrerDDcRziCsNBc
         FknMfnNsfVOujgsWVOKSJYIzrAAnntHy3VFIoYip3PlptNxULk3HtftW47RLvraO40vU
         AVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754346876; x=1754951676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOe+oseDiKDWnydBzNUnhpGVuR6PDQg1TJ9zx0VvakQ=;
        b=R4AoxL5SJGLJ0XZMpcvZBIOFFEGV3fQgNeoYCCxVxzKrfNGenMa/IXwq1SWgcYDNAt
         LMrPUe9seY/2qZ6PaLHdxpdl6h01SZgKGb2UTaj/Y6KnXjXOJxrwx+BPOrYdpKZ/bfie
         kv5AzqG9IzLdyhww0GfdakHAKbIe1EGE26mwfVbz7hbQf4sop4wCmkzoYkHVCdupZ+AY
         DcHLqZ1Ad0FnQg9LyqWwNqIWYpd7cLTIIeD2jB6qjZuxofyxn+yr/+QYoYmZxQ2WeqdA
         yp8ypY1GwiR3yJ83RMl9FxE811jgCyTIbNYfVPkc0KvlG+u4bKVYXbtua9vFrjJHzqCw
         +S+g==
X-Forwarded-Encrypted: i=1; AJvYcCVibEy9gil3dTY7YlIUhyfexTxIlmfIXEoRwARttjVGagbf4ujY2TBAzKmwj78O7Sj6Cty2Sken5nVDgg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxY63H9LdEQxfQyEdYuIRcmnHQ3SqLwgz8nII6VwOH8E6qddECe
	krlQidOvgwBmMm5z45p54vCd8pFXKj0UxN6jBqOl74ydKxuv51jSaKTO
X-Gm-Gg: ASbGnctnOvV1vTYQPItRhGsqr3SLaJhX860llPKlmGYhptqAn1jLOS6YHogzG2FUZDB
	8M3RHRBxtrQrJqUOpGBJYF3XVDpcETU9P757DgNundf6/DC1dB4qzRK1C/agaZe057FwvO4/P0E
	qb7mvNEdR3dX6NhdyEAjoeK9O8Wz6GUBBwZQub4Mh/b3fcYcTLQr1wh5f0JqPGK2LLa+Intxj7u
	BNMg5cis5nJdcEc92y50thOksGWUd2CaclWnm7fcOsDPeXGYq9U79Scn9o2w+LzRRNQGj/s89z8
	anCb0GEzjskvdoKytba8VOAwQEZ8yFoG4VVpr2ERYa3nav+QORqzILKoSd+DNSa6MqmDrJhTb+S
	rOJhrjSck2tZ5NNjIpUJLHNntgbEGRGv2pw==
X-Google-Smtp-Source: AGHT+IGd8DDZ8BWAVJh7j/vBDdXoFmEdTXbAwA3/m84GUdaa2S9/2l9tNyJgnm6A6l0F+/T0kNg2nA==
X-Received: by 2002:a05:6000:2204:b0:3b7:8b5e:831d with SMTP id ffacd0b85a97d-3b8d9472d25mr8064796f8f.17.1754346875994;
        Mon, 04 Aug 2025 15:34:35 -0700 (PDT)
Received: from debian.local ([90.252.123.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3abed3sm16807486f8f.10.2025.08.04.15.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 15:34:34 -0700 (PDT)
Date: Mon, 4 Aug 2025 23:34:32 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-kernel@vger.kernel.org, surenb@google.com, bsegall@google.com,
	dietmar.eggemann@arm.com, mingo@redhat.com, juri.lelli@redhat.com,
	mgorman@suse.de, peterz@infradead.org, rostedt@goodmis.org,
	vschneid@redhat.com, vincent.guittot@linaro.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] intermittent psi_avgs_work soft lockup
Message-ID: <aJE1eGwVkQdfDeOF@debian.local>
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

On Mon, Aug 04, 2025 at 09:32:40AM -0400, Johannes Weiner wrote:
> Hi Chris,
> 
> On Sun, Aug 03, 2025 at 11:14:42PM +0100, Chris Bainbridge wrote:
> > Hello,
> > 
> > I'm getting intermittent soft lockups with recent kernel builds. This is
> > a new error that I haven't seen before.
> 
> This smells of the seqlock re-init problem in 570c8efd5eb7. Could you
> try to see if the below patch fixes it for you?
> 
> https://lore.kernel.org/lkml/20250716104050.GR1613200@noisy.programming.kicks-ass.net/
> 
> We probably want Cc: stable on this patch now that 6.16 is released.
> 
> Thanks

That's the one. Thank you.

#regzbot introduced: 570c8efd5eb7
#regzbot monitor: https://lore.kernel.org/lkml/0d86c527-27a7-44d5-9ddc-f9a153f67b4d@meta.com/
#regzbot fix: 99b773d720ae
