Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E952941CB39
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 07:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234907; cv=none; b=UmQ4njKE5TFAJ7fTxqrisvmQ5xizFI6UKMi+biyNniS83xCgsXfHdTdrorU2n5uEqb7vouYwLH2K5Kll/LlEXPXtWyJ5q86K4AoGI7phXdoClUvBiaf3Db750LzHwXTzAFSu+V30mDX+391+UZwLxUtcRnTTzFxL7EpQ8PAYhxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234907; c=relaxed/simple;
	bh=UHQmlCcKV4x98sHxuZMPnjMue+nilcOmstbKCOY2/s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfcVUBOmJBhPsXBfNAXxkNBWwWrJyyBAlu6O6r/2iiaI6PRl9y1MN1v4LJQ84JSjH/cH39X+LLoOW0YVfX+H5gqZEnUnvMnvg7Y33HQa02E+h4hHKj/BRnxezj0ySbKY/XV8Ne3MSAu/e1DX6Z7f4Evf5ugGBkSNi8FHMZsi6Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAcvdNlC; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAcvdNlC"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso9491315e9.2
        for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 00:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790234904; x=1790839704; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c/+VrgP7wAI5ReczvO0a14U1+2AXtmCv/lPUe03W47c=;
        b=qAcvdNlCCvBU/1fdqkR+YXCk9IK2v+1ACAvkfqnlhz7kokmE46cLLc7Qyp4wrydTug
         4LAj7abdZg/Gwx6LfnC1WBQbKTo9UpCOR9rsdh20FdBGMTDkN7smSF+ckKBHjEiS5sns
         oUpo54aSQqY+P7gj80krQC0H05v1RZqWaIBePXnU5GOcagz7LI9XvyJ8Fe/jc9aBhA3M
         /r6YH4nxIyUAgo3oisfxNQZf5mW68d18pbApj6als84WSJznTuL37drE3mkQgBjlI6o9
         lwkWUqAPDKeNdBdrbqZmWf4UQvdPGH7JVwVoK3JrDRH89HsAZN+3NKF/GUqd+YatuMQr
         ONNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234904; x=1790839704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/+VrgP7wAI5ReczvO0a14U1+2AXtmCv/lPUe03W47c=;
        b=XvbXcDecerJZvmH6/uc437MPE64u1JU1tbW6u9VgRbmo6IZ4xFflrmrcQpZCJkDg8Y
         VgmkN84qYTnGtqNCsJ5bHKbUqDK5glApuDFNDLzDs+W0gtcsNYPActQJ/aStsITWFGNB
         /CqP1vl/mArnXmmBL8AB3vX6ZN3wxeMHMAy2SaCoHjXigdafNO2feTnL2ZZmnfw9yd4Q
         oWOUOSWPUex/4f2MpbPwCNbbm5IW382aa2FSZDqSIg3P7EBdiTW4txS81NETTG+D8CRq
         9yN5QZOB1nFJFF09sGhOrGWThmoAdxzuiWCI1fHIUxEtaS+H7yTNNF+VTANAHLKavys8
         rR9g==
X-Forwarded-Encrypted: i=1; AKwUvByxMIGAgaMtoCnMl5DjmTjGSn7JLkJfiZ+MC+GRL00JdUtJqz1DoID8xzUusxKDtnAOc34+qOf6ycxjMA==@lists.linux.dev
X-Gm-Message-State: AFuF++kPTdDGKNIgr/6l7awS3mi9vfKfNkR/KX1AxDUv1WoOw1kg83/J
	sqossaQua7vv0JWR3YTXAvIZ1B9yAIyTI6nnPLoqaCa6rvVJrcvs+ogb
X-Gm-Gg: AYBFou3AgZejYH/lED/jMNZquS0q5zq0VpDNVbj8bbs7jcNOsdFz6Mrpw+7GtPxGyBp
	lj3g7x1aDdZzW0CgRZ4lAu0KN8J8/kFrQZu5S5YawUe9T3ZZw1kbfsXL3BYbVPFJb3iABwkBck2
	5OdjIMfihzcx9znaE4HKjL6mky5dlU80+OWoizsPuXl5bphQw06GzjbbkWzQ1PNumBD5jeWq4U5
	30FRh6jd0MyHweH3+b38jvw5NZXHglEoSS9cR8Hwqggs37eZQEfdLYyEW9NQG80FDGKwXo+2Nfe
	LMmSdyt/JdMhd+KBVHFnMxJMXTX7SZge8LuoQhEFQ0wojrrMTJndqHClY1NydYn9l7ANfzi5dJ5
	XZbDkv2mt1hzHqrxMg/WervSTkkirIa6BxvEJBgYVEcWcdBj7Kn6Pxs9TM+7GNxtl7FnSx0JfQf
	0wh4X87A4xA4qcOiMdjJxLxwyZ1LFGUAERHEyCQj5YES8wP3AN7hzMeOqjVOr44Hdir+oQEZOPF
	om2r7SK6wInoKW4F4Q0TG4fhm4v76K3Ma7900Muq4TLiA78LETJqOolZ2ULpmQUHyMJlws=
X-Received: by 2002:a05:600c:1391:b0:49f:ce73:5e96 with SMTP id 5b1f17b1804b1-49fe670af91mr25055135e9.34.1790234903741;
        Thu, 24 Sep 2026 00:28:23 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd42f2sm44430895e9.15.2026.09.24.00.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:28:23 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	x86@kernel.org,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: don't defer freeing kernel page tables while booting
Date: Thu, 24 Sep 2026 12:28:19 +0500
Message-ID: <20260924072819.33277-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
References: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/24/26 09:07, David Hildenbrand (Arm) wrote:
> Should we instead simply skip the
>
> 	schedule_work(&kernel_pgtable_work.work);
>
> and rely on anybody freeing stuff later to just free that one alongside?
>
> That avoids throwing in more freeing handling.

Yes, that is simpler, and the early table then goes through the same
IOMMU flush as every other one, so there is no need to reason about
what an IOMMU can see during boot.  The only cost is that it waits on
the list until the next kernel page table is freed after boot.

I'll send a v2 that way once I have booted it here.
