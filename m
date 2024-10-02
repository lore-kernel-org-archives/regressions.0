Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724281E7646
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 11:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868515; cv=none; b=UxHd5YJJFPQNeRb0AtlBVWh0QYqEAiAbNAyqgJmGlnwqWvefjYjIpY7oF1QhW70pKKYWme5ly7AwgwQZYr/JOT3aaaxhmLvgkDJPfR1JhOMw/5US490QxWxS5XYt7TEQ9E4UftTstvzgPGHRPGbdV5ZoGTVJo8C73PyJFHi9YSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868515; c=relaxed/simple;
	bh=vZhy5RK2jzgVOh3tvzv0EPTSBO27cI+FkL56P8MDDFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTUCOY5toEK8T+QfF9Bg7QgwKipaWSIjJBA1xN8eCP4OnWPTqCJlNs9ZTCFMrFBVd3VAfJOtU4y3oAZKzpwMOz32lY/QcKg80z0prCYD2+I12imV1rQ1+ZSrWrqy7Sipdew8B5la2zQQfWvUZPcc4slHpE5cyu30FI2n4p8PKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8eDo+ib; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8eDo+ib"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso4718535e9.0
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 04:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727868512; x=1728473312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T3CsujielR0/Lj5Yt3DNTU+m+GpBohBJmAfQEZ4LT/A=;
        b=B8eDo+ibTxoSs1QVYa/ZZLmSHrnMKUkfMsfPDFL9cQU5Ide+oSzjCm2my3RhigdmZz
         4dcwykMLVWMc96SJc2DaQEq474C0FpUSPE1TZjRchI7lEtaa/0cYIETfV7LR802BBvcT
         5gLcdBzOxw80HrJM+Ogp+idsPemZzvipwYsU+dD3qvLrwUzHVDRydTzUO4AdhBpOUKEN
         VAhqDUzO5TriLn5efftm/wIkGzXjIuJdr48EjZ6etfRWO58QXsaLZWQCUFxMukmcEzqx
         JOPPwAH4reTKuNJSVaAnqgXSsMaWAmPL43CP1xiQdXY557cRwUZ9wmkc7E8wTd7RGUhJ
         8GDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868512; x=1728473312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3CsujielR0/Lj5Yt3DNTU+m+GpBohBJmAfQEZ4LT/A=;
        b=tHInt4bIa0iVjBHpTx1CLyCKibgy3ZvsyeIIFqLjWVtZuyY9ZLck1Jg+n2Wg1rYxh+
         BnmhYM6IAu/Jc7nCqZTj+LqikHwLiNaLD4q4P/OlRVm+j8k5MBX+pWeaxqr9EMt7YJHB
         PVckuV/oHdGvT/mZIiTd+9o1BcejlWQfOkOcqAOvLLURECdqPxTpvozDk063nScnye+k
         ALz4eZNE0GHVSyiHSh4/sInyAiELYIS9atQdnhmUyixOL9UMsO1N8Ed3+ncp6oSaqKBJ
         6m53GZLFZCGaF9gmrJ1JNxvsoCQ0hxLyD4rX3eZbGf4Y6CjdR9fwncp2NIIypB+WcmJ3
         4etA==
X-Forwarded-Encrypted: i=1; AJvYcCWcu/C/cQFf5FYH+BZySonohPjL0fOgMLsTp0pajSZDfOSz9kbsupL7HpSYF9eZp2BoFAZdUxKJw/TxIw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTar/eXr2xaZy7Qt/nekl/IJAzrq8mp7cDKPgN5VoVyyjAUyHc
	4+C1SiFV4iy4gCpp/iaf9p7Pido0si/zxAMcFLgUvvAIZ2DZf/lB6++4VrWeadI=
X-Google-Smtp-Source: AGHT+IHWQoJyjFnm5vg1HmB7MSlkALHoLRiM0a0Cqaw736TMNSFThw8Yvva956argTiJOV0cwtJp7Q==
X-Received: by 2002:a05:600c:4710:b0:426:64c1:8388 with SMTP id 5b1f17b1804b1-42f77720814mr15171335e9.17.1727868511844;
        Wed, 02 Oct 2024 04:28:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79d8d693sm16276955e9.2.2024.10.02.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:28:21 -0700 (PDT)
Date: Wed, 2 Oct 2024 14:28:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Kairui Song <kasong@tencent.com>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-mm <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next-20241001: WARNING: at mm/list_lru.c:77 list_lru_del
 (mm/list_lru.c:212 mm/list_lru.c:200)
Message-ID: <62a65418-2393-40ec-b462-151605a5efcf@stanley.mountain>
References: <CA+G9fYvo5npQ3o_vgiOX2guHtgafRoFPL__4O8Kcwg2=ssXmKg@mail.gmail.com>
 <e718bc99-e63b-4adb-9e40-2379f48301f5@stanley.mountain>
 <b22dbfe2-dd29-40de-a4a3-4a0d6b55cd65@stanley.mountain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b22dbfe2-dd29-40de-a4a3-4a0d6b55cd65@stanley.mountain>

On Wed, Oct 02, 2024 at 02:25:34PM +0300, Dan Carpenter wrote:
> On Wed, Oct 02, 2024 at 02:24:20PM +0300, Dan Carpenter wrote:
> > Let's add Kairui Song to the  CC list.
> > 
> > One simple thing is that we should add a READ_ONCE() to the comparison.  Naresh,
> > could you test the attached diff?  I don't know that it will fix it but it's
> > worth checking the easy stuff first.
> > 
> 
> Actually that's not right.  Let me write a different patch.

Try this one.

regards,
dan carpenter

diff --git a/mm/list_lru.c b/mm/list_lru.c
index 79c2d21504a2..2c429578ed31 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -65,6 +65,7 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
 		       bool irq, bool skip_empty)
 {
 	struct list_lru_one *l;
+	long nr_items;
 	rcu_read_lock();
 again:
 	l = list_lru_from_memcg_idx(lru, nid, memcg_kmem_id(memcg));
@@ -73,8 +74,9 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
 			spin_lock_irq(&l->lock);
 		else
 			spin_lock(&l->lock);
-		if (likely(READ_ONCE(l->nr_items) != LONG_MIN)) {
-			WARN_ON(l->nr_items < 0);
+		nr_items = READ_ONCE(l->nr_items);
+		if (likely(nr_items != LONG_MIN)) {
+			WARN_ON(nr_items < 0);
 			rcu_read_unlock();
 			return l;
 		}
