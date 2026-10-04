Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCE01CAA6D
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791126549; cv=none; b=ArWH8n/R55vBL3HNF2QydibmO+7rMJAeRkV96f9hppbpyfA1IofyE6jsiNbOQNKOOLA6e7PWZIGQD9ajNGvpHUtR+aNIYWYuEAWq5M7c9MKbxEbdqJrSMcrvAsJr669IlI4lc61PArm+RiUO78+84bM8mRyafVg04TSkq7N3Wjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791126549; c=relaxed/simple;
	bh=5P7vT3iSbLKV6feOMsggt3x9Pb5isvTm/Ost7rVA3eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMZph3NzJmkZ5UksrFj+J9AGywCO+OpBMXZAlDaaH8Hhm5tljaHcxL6VOZ/UyhZCx5BnBCJSCL3tldW152h0MFMGz+oh7cBLQqUljPHVtpLiuO09iNtPZbBTaFxKQ9BnrDUbsCCQ3ZuZwxoeitKEWX6qp8qRQTAJyr/siYFFJu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=LpoIUQLT; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="LpoIUQLT"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3AC1F3F1ED
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 15:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791126544;
	bh=gjPynkeSS8mj+Hdi4I2aqG3Yn3kZVr1yRJIIH48r5Y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=LpoIUQLTpJa75xfXo1Yy4Ab2Q0bqyQRbms1ghZXdeOXBnPr8i1Qu5CRVM+2//H8Zq
	 wIQhbJdr9ZBbDsE+ysoYGzIgE84pQJouWZH1OUtJbBsbtkiZNWv2y4yiQ0VzA8WMc4
	 H8eHMKxeiwwhKuD+fCVFDNqjK3JWxSw3NHB38J4Fsoiko8DnefUjJUEoLd+VGLWl2J
	 GSqIOixwO1L3PwXohEo3UjAMSIFbQ9r3ZjRcx2V9etfNe1i34Q8FwqYDJ2VNOiQpOF
	 pY6v1A0kiPwCd+UWcFcsSpNukpR5FB/WjGHQXfj3ltQHZDpScgtymlb42SyVjq0fxu
	 KB82o/Yz0hFQIEobb0bMiCGjHTcfiUeNfpq61uuSq8LMf33MwzUBhnLFYbFa8RUHYb
	 6B+utuby+DeRxwp2Dh8ZSrSjAc+Fg87feH1fKyIvc3FuVYCYOQC0a4uVpleKI4b1qw
	 wpRxsryILsERTFqxON+9PmVEYcfby+naORmNENZPD8vY9P3+7M3vQ+A6feA6y9BgUJ
	 TpRqMgQjkUX86agA7Cp3rzhYPVatl0fN/wh5LViLllONNFymTOVucjI1ySp26veoZE
	 WOcig20t2D+tOjIVnu364lt6XGTr/4h6TIafRPj9h6ndQzDLlHeME9KlzZPFzOErf3
	 WdqoH0Wqdaan0Y2+ogDR3Iqs=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49e6862e924so10945755e9.0
        for <regressions@lists.linux.dev>; Sun, 04 Oct 2026 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791126543; x=1791731343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gjPynkeSS8mj+Hdi4I2aqG3Yn3kZVr1yRJIIH48r5Y8=;
        b=R2+saV+wB505GLl5N/9IlmerzqkG526OCYxNXHQM119PW8oW7QZdScZmI5gCeeA+Yk
         6MGlkouSZ+CiAHSz1xu/HO7G69fcBpWkZpJRmuLAsDN3GTpC7vOn6WxBx+KNdFSvjLTq
         bpF2BmEoyVpKYHLGS4TcTzWfZ0oiIJALe549PgNX/egjUEbuHTafe36FoL6o3sJqpZVX
         +/yPEoWkRzosD3AlftT2DtvpVnwiJhMiE9i7DpkO46a76CRkuWAQ/yTvNHJ6p6znzrR5
         Zhn+W3k3uvQk49Kn7/5uHoizzJsjponyBeyRcvk4tETa2uStWBL8rwTMSOtxcaL91MP+
         Vjrw==
X-Forwarded-Encrypted: i=1; AKwUvBw9jXADAa8+t1WcIslJUqLycfzBr/ZhMWFlPGip/Hv0MkiA+sQ/IAaOrqzb723w7fAtUmdPZ0a+DAyy5w==@lists.linux.dev
X-Gm-Message-State: AFuF++nd67WF/OUopKFD+uc/6vflYnJxyB+FzVj+2OBrPnfD9lsb7fy5
	z7VpHroKNs4qp8aT0OE1pJukUdwCBHG8QYsEEEGxUvNIFy5DZ+ulOZp+I9zJsn6JG9wdtblTqw1
	s0EFF5H9NVCa3dDVK3Rab1xjCQ91taPO2+DIvuWa73r7bHgo5f4EvH7fTB3uL9m01Pz7Yv7YALe
	W+DKQP
X-Gm-Gg: AYBFou35OxdyerUqETRYiPdCXHSvnlLPlxZIT8AV1I4IWbGQn1arZQ3vmy3Yrdd7EyO
	9P4zyBEEDS9y+LXsYjdDDh3dwlE44Rh8MK4pFAs/o+yIWoMD0jAJ+m6zIvcVlpYl26e3QetUBiJ
	Y3QRoCy3mJGg0/cZwnYGHTu67JBgdtJv1Kev4voaQi0JV8hFNxTmHPNs8y925XSRtAh2ZPAGovO
	631ndmbXtyEm3hAGyxFQd0lgyvYniuFMRYM/71dIraZ2ODqaXfCFnjSpZmW3M1HhCY7imsGmJQX
	LGUeCfVW8PpSHtcpYKc8lUYFOHl7OmY0IuzDoaY8u2gZFHMSqC7GVaxv4Ornmj6EPzZphUjPeUZ
	1N+nU7Rs=
X-Received: by 2002:a05:600c:4453:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a1680f109emr87154355e9.15.1791126543672;
        Sun, 04 Oct 2026 08:09:03 -0700 (PDT)
X-Received: by 2002:a05:600c:4453:b0:4a0:2423:946 with SMTP id 5b1f17b1804b1-4a1680f109emr87154015e9.15.1791126543248;
        Sun, 04 Oct 2026 08:09:03 -0700 (PDT)
Received: from px13 ([2a06:5902:822:4600:8c2f:7cc8:bd95:9422])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm272425775e9.9.2026.10.04.08.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 08:09:02 -0700 (PDT)
Date: Sun, 4 Oct 2026 16:09:00 +0100
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Jason Miu <jasonmiu@google.com>, 
	Alexander Graf <graf@amazon.com>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-mm@kvack.org, =?utf-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Subject: Re: [BUG] KHO handover hangs when memmap reserves PMEM
Message-ID: <asJc1GIBbCJ26akS@px13>
References: <asE0R_f2r2TL-3Sy@px13>
 <2vxzcxtplh4i.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxzcxtplh4i.fsf@kernel.org>

On Sun, Oct 04, 2026 at 03:39:25PM +0200, Pratyush Yadav wrote:
> 
> Just to confirm, the first kernel boots without memmap= right?

Yes.

> I think the main problem is that the radix tree pages can be anywhere in
> memory. So on the first kernel, they can land in an area that the second
> kernel's memmap= reserves. So kho_memory_init() might end up using
> memory that memmap= reserved. I'm not sure why exactly the next kernel
> doesn't produce any output, but IIRC memmap= memory is not mapped to the
> direct map, so accessing those pages likely causes a page fault.

That's correct, kho_memory_init() page faults. It happens before the
serial console is available, so there is no output.
