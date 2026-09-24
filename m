Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F90E3C13EE
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242757; cv=none; b=A/oKc7z/HyhU1t4E3Wer8TYeGKjb92AoqmRoIiIiybxMZxJY7ITIhwYVK6U48n5dmeYEuNAAv6MCh0Zh3XSQOddaUBwF1xSxVGzDMlbsFNvMuRyahIfCxFV+TxmXonr9z8FVvsR5gx2gT3Usmh9MHeepQrAkVvjEXri2NwJR9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242757; c=relaxed/simple;
	bh=LfT3h3IRUJIeIqCLIWflG2ESFNR0GkhmG43HFl2Rgv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXR6T/ngVPp7eRW4avrTimUfbv9uR9RT7FYaveyhleInZ+nodokwmnApE0iY4rOhgBbmyOnrAQtZsPBvJIcTklBalEmLhFrS8BmhO+nBMNQcN+v1SaiL/sa0C8Cebjbb1O36wrlzxLPtJWwPnpuCPIC304uqI2tNEWnmb5tCMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nl+8jAw6; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nl+8jAw6"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f89so1291860f8f.3
        for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790242753; x=1790847553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo1Dt03xk0CNyDvjLToBhLcXGkmtA+S3j19+BkyISnk=;
        b=nl+8jAw6iWy4r8yEIWybkFrcJwYgJ8G6VvIX0kmOK/oA1i7B2vAox9rFq3peMwMfvo
         dZmyaf76ZwRkQpiswdKocJ4Egqj4nwgxU5sHDyt+T3dRyM3aZLVdsH3SVFXsC9d6BS5p
         n43y3r+rRb0O6zy4OAbV9bMx583mwdraClqVi5MMhdqIkOzUS8wJ17nfos+ZTygVSzri
         GPk86FV0Pny0ZCNrjNCe06eaFF1acigBYWwD48Bch16ARDQMAMEJBlmAiRfCDcT/wMWN
         qbIy/KRlmtLGJMmCOpe6dTtdFu9xARCudaFjzBMaox0cW1jnSi93PCNKzyhYeStiblI7
         s3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242753; x=1790847553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo1Dt03xk0CNyDvjLToBhLcXGkmtA+S3j19+BkyISnk=;
        b=xOBu4FtcCmBasmfdP7eNwspBzornzGoSDMrc+tKyt4TE/6Dk4Yms7jpwGDbKtPJR+S
         zdym7EQ3IV2FiEaIOHgbvsP686CH+NGBQrvohmQKu/2QRFCOS3mhaGNMy3YvPUX8zV4Q
         JEEGMSqY2jQZglEEzT+v3gaf+iehyrMjW9jEC5b3uZUYoS/kJcvinUXrMcE/OkQbDZRD
         YK+1tPwZ3QIBzUZu+jERUfWvHbJeVNcmkZxDOi9c9OsN3/2kZuBGJrO4wmVoyss3mpg0
         Boir46z9ERV9YazZ/PknOgGvAQXXGb5APVJiZ2TAnwhjyvhYqAYQggRfC5SnHMeke3+U
         7/7g==
X-Forwarded-Encrypted: i=1; AKwUvBwIntMk2eIQvTk7t5MfYVBOl40oUC8HGo06NSEzqiN150o2kTSdGJxQI1UZr1ECYPpAgzNedkysYRL9nQ==@lists.linux.dev
X-Gm-Message-State: AFuF++m70YVy1F5Ndsf56Kg/rRarqzU53yX5mtrOrPWCMumLHGJRF1Th
	27pjz09HyyoC+9yzQ82btseNqSDFf6rEf/DK7612/L7ud1y4iSKSEjgu
X-Gm-Gg: AYBFou2HYThAuvPcY6n8FUV4kySl+syCuVcaKQOxtUqjA5GNCqDKoYYBoCWZoJe2INi
	MPaw0WrDvvvYpMDEXffnjCx+tJpkAXf3rb3snQP6oeMcajHPzfwTpvD0KGn+MlAZ9oqBTGM2vyJ
	v92kfUpHlw03sVi7U6YaqVpADvIEVFEgqXJBpXIiG26EKdnY9UI6bw52CmMW6kUpl1I33QwK0FJ
	rNPs18tDwmcRJYXMwhLOyacUekGW4IHiq907rl8tOwINiRiWTtRREYNrTNG6vz76GXQd37BIKju
	ykd3I/ON60pXhj2+hhNY95wzAv4I9lrMBRV06RgNBCpoIwUAatjekvYyrTkhuK6gRjw2Z4KZvRh
	dijaZbDbq+XoMOzb6DK1lJ9GlUIIOuMNuda7X43A51+z7QguBZSnz1NuyOnyvMRMkPROejVcuuJ
	Bo0FGWZZVzP4DEYURtropymREQ9MyfcUmOYlYip3+WuDINQHVvVNNp/JR1nOcdJxv6u4pVuqK1S
	l3u9dmsJgPucF1eJIe5JYO6MKiCVCJCccXUxIhceU2LWUUL6Ipl6/BtzMkjMP6UZR2aSuWg
X-Received: by 2002:a05:6000:617:b0:486:f46d:bb02 with SMTP id ffacd0b85a97d-4887197b60emr3087180f8f.57.1790242753297;
        Thu, 24 Sep 2026 02:39:13 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668e7sm15230022f8f.4.2026.09.24.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:39:12 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
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
Subject: Re: [PATCH v2] mm: don't schedule deferred kernel page table freeing while booting
Date: Thu, 24 Sep 2026 14:39:09 +0500
Message-ID: <20260924093909.25643-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arTtl-7Nl5Ie0SEs@gremlin>
References: <arTtl-7Nl5Ie0SEs@gremlin>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 10:31:15AM +0100, Lorenzo Stoakes (ARM) wrote:
> I know I said go ahead so it's my fault not yours, but in general please don't
> respin so fast :P

Noted, sorry for the race.

> Maybe we want to ensure the drain? Like below:

Yes, that removes the one caveat v2 had to state: tables queued while
booting no longer depend on a later free to get the work scheduled.  On
this box they were drained at the first module load, but that is one
machine.

I'll mark the initcall __init, boot it here, and send a v3 no earlier
than tomorrow, so that the others have time to look.
