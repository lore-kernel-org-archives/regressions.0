Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA612270EC3
	for <regressions@lists.linux.dev>; Wed, 18 Mar 2026 02:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773801481; cv=none; b=gqZj3WTWxvGOWGcFyPELi+5BM5S+Qn6lXbs9dDZvwZbEg6kRqdS49Hgu8H3zb701qDF6JClLktPOspBtW4CS67oJXnhjUy7pMn0oVWrP0uWLTGWR1ueYmR8Gqbz2tejHXYRX/VcAhdQPBw7NiTeZVBW36OLi7XgmMi7kh4FrjRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773801481; c=relaxed/simple;
	bh=n0w6e/nOGgYAcidng5lDiAq12GtXKpGxxsbG7TpMjxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z3nmIS3t1YqHSXMGUNaMk9Pa8WtgVAIzmXjjTGg8+tiUty1SrZ/JNWMn8hPCi31nXzSrHk/LG54NsabVmD2CGPELAt6KdbteZA1VsMRzjVygh2Eh+TbBdcUPVgp4oMXUhu5OZLvvMKQG5uDzTAK0D5Krk6Nd0wA4wFBue8n1Q4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zm/TJ3ut; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zm/TJ3ut"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-67badf2d5b6so3490007eaf.2
        for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 19:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773801479; x=1774406279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHBZTmx3gpGoOcOvI5wr45XrMLqrJh4cbl+ScbRtWNE=;
        b=Zm/TJ3utHVoHmZT/r2Tg4yhV9iKOovtR39DmssNcmK31ie8iQ2UVFfDe5IN//0WHMu
         NBfQ3zE08Q6ZYfN4IwoBMIFEibxEC5jwag7hVSmGskyYnsAXDt+TnqrJsetIvY7gtblg
         C5CWphwlkpcycdbQz4V3sxkuyhQCCLHOEwqA23qLjRlPLGXw5+0CWIxGNsWUuQbbIZgG
         JvB1/aD91n3KFZC+ckmMmbTxCeN8d5sXQz0VBeH45229aTM2s+11n7FfpoHRT8fZYNk0
         xHFrbKu587/ce9x/012f7KXw90MDKJg4x5842RALB2+qFXL4XmwqgqKxcb4rCjPTf21R
         t+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773801479; x=1774406279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHBZTmx3gpGoOcOvI5wr45XrMLqrJh4cbl+ScbRtWNE=;
        b=gaqySdK+6Z6pPpqtkqmjuzFQA1B5yHoEPuvRYcyJ7bRMDMbbRWpFlmPnVQLwvf2qr6
         tRADIDXTznjej/utQOKqIUtobOoe3HpWYinKlAUSjiGFpqxzPH0da2nGnILXu1za8JLb
         8212SYki9xitzYZwd93jla4hVIZQACkmo5jLhDTkN5b6+kcDUIxpinVjwtO/wg/tF9Th
         ssMcfFgpOeKr8D9X9znhDrtZc1he85RMsuPhC+fIiRoyJSK+IXtnY9XG3pLUiyIWUIt5
         y24agojIiXcvIK6+GYRna9oa+efey4mdjxT4eMhvMdnr8zD8xE50jVed6qovcdcHDw2q
         R4Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV9OsReXYbNe0BdxiTexRogpMT5vzYpj5MrNF7Oa0315wBGPIO+3M930iIdvES8h7ffNw4pRjSBRSReYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw64/R+6pScZiqc2OM5+v3fcfGS+qt93Apavfi0/5JUvKIS//LV
	PVwroXyQY6H/W65jzmgCjk0eL3LLHL441t1XVgVa7zOWvXV331k+Gdyn
X-Gm-Gg: ATEYQzwk3eLvufNHZSRmYGC/RD29JyVawCjqQrbAkMXV48qettZG+9G0oa34yEFsN0A
	9CTT4xjjjOfqt0NyJRZ8c+8zSs00V8Kw6ixlX49GmGlLT7xSIQp7QHHd6e2JHcflj9jNeCkD5Gn
	BmcNPvq0chxTbEvOgKzNFuuLc6EvI4jHxzyXOr7D0+2hfwmpZ0mj/09boY6w6Tf7i7OZqACOEhT
	wZhI4iRduw0F811Pwh1t474k4TmiFUrhbLb94F1Ma/ggzbpimw91vvz2PTh7/9UzVE8ZhO0KsNs
	UOg7lQazft4oSuEK9/jJ48jEU811+jkKMOMFy74v0EpbpKOAMtWstlpKQ3EtoVGyGWaQFrfWuED
	E4KijtmUtZtPyk2/+gEgQWscV/JmUIsQa2Yik0m7h+0erYS85cWfvvOAdQg/9lLwfW8cdEYWLUN
	cU5wm2MDeyE1cUAubTJFujQ8V7ipGGBsyj15g5Widh4Yml+BohDTFXz7XWhR0u5MDJeUVA7TNB
X-Received: by 2002:a05:6820:2d43:b0:67b:c368:136b with SMTP id 006d021491bc7-67c0da8c338mr1059481eaf.29.1773801478708;
        Tue, 17 Mar 2026 19:37:58 -0700 (PDT)
Received: from celestia.turtle.lan (static-23-234-115-121.cust.tzulo.com. [23.234.115.121])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67c0d88c5bbsm880101eaf.10.2026.03.17.19.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 19:37:58 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>
Cc: Milind Changire <mchangir@redhat.com>,
	Xiubo Li <xiubli@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Sam Edwards <CFSworks@gmail.com>,
	stable@vger.kernel.org
Subject: [REGRESSION] [PATCH v2] ceph: fix num_ops OBOE when crypto allocation fails
Date: Tue, 17 Mar 2026 19:37:33 -0700
Message-ID: <20260318023733.116789-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move_dirty_folio_in_page_array() may fail if the file is encrypted, the
dirty folio is not the first in the batch, and it fails to allocate a
bounce buffer to hold the ciphertext. When that happens,
ceph_process_folio_batch() simply redirties the folio and flushes the
current batch -- it can retry that folio in a future batch.

However, if this failed folio is not contiguous with the last folio that
did make it into the batch, then ceph_process_folio_batch() has already
incremented `ceph_wbc->num_ops`; because it doesn't follow through and
add the discontiguous folio to the array, ceph_submit_write() -- which
expects that `ceph_wbc->num_ops` accurately reflects the number of
contiguous ranges (and therefore the required number of "write extent"
ops) in the writeback -- will panic the kernel:

    BUG_ON(ceph_wbc->op_idx + 1 != req->r_num_ops);

This issue can be reproduced on affected kernels by writing to
fscrypt-enabled CephFS file(s) with a 4KiB-written/4KiB-skipped/repeat
pattern (total filesize should not matter) and gradually increasing the
system's memory pressure until a bounce buffer allocation fails.

Fix this crash by decrementing `ceph_wbc->num_ops` back to the correct
value when move_dirty_folio_in_page_array() fails, but the folio already
started counting a new (i.e. still-empty) extent.

The defect corrected by this patch has existed since 2022 (see first
`Fixes:`), but another bug blocked multi-folio encrypted writeback until
recently (see second `Fixes:`). The second commit made it into 6.18.16,
6.19.6, and 7.0-rc1, unmasking the panic in those versions. This patch
therefore fixes a regression (panic) introduced by cac190c7674f.

Cc: stable@vger.kernel.org # v6.18+
Fixes: d55207717ded ("ceph: add encryption support to writepage and writepages")
Fixes: cac190c7674f ("ceph: fix write storm on fscrypted files")
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---

Changes v1->v2:
- Added a paragraph to the commit log briefly explaining the I/O pattern to
  reproduce the issue (thanks Slava)

- Additionally Cc'd regressions@lists.linux.dev as required when handling
  regressions

Feedback not addressed:
- "Commit message should link to the mentioned BUG_ON line in a source listing"
    (link would not really help anyone, and the line is a moving target anyway)

- "Commit message should indicate that ceph_wbc->num_ops is passed to
   ceph_osdc_new_request() to explain why ceph_wbc->num_ops == req->r_num_ops"
    (ceph_wbc->num_ops is easy enough to search; and the cause->effect of the
     BUG_ON() is secondary to the central point that ceph_process_folio_batch()
     is responsible for ensuring ceph_wbc->num_ops is correct before returning)

- "An issue should be filed in the Ceph Redmine, linked via Closes:"
    (thanks Ilya for clarifying this is unnecessary)

---
 fs/ceph/addr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index e87b3bb94ee8..f366e159ffa6 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1366,6 +1366,10 @@ void ceph_process_folio_batch(struct address_space *mapping,
 		rc = move_dirty_folio_in_page_array(mapping, wbc, ceph_wbc,
 				folio);
 		if (rc) {
+			/* Did we just begin a new contiguous op? Nevermind! */
+			if (ceph_wbc->len == 0)
+				ceph_wbc->num_ops--;
+
 			folio_redirty_for_writepage(wbc, folio);
 			folio_unlock(folio);
 			break;
-- 
2.52.0

