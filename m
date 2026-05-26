Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA8D3DD510
	for <regressions@lists.linux.dev>; Tue, 26 May 2026 10:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792018; cv=none; b=R0TmptKrkpYJXTuJnUhO7JBLvZZMBzOY5xrOJsWhBG04erqWWLMpenxGTFWCRRq9ybQXqL36O+43SUAEo/YSIoKJmbgtg0eHwnbu7qm8lWD8NuBDJHU1pbDsGnFreEgzf9ubjBTKclj6+m5pb3t87GmhM19MSkAsJBYAqGFWyX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792018; c=relaxed/simple;
	bh=Bls7qHvIUDoc4ooazcpfeyKMHkmvPOvpEwus1CeH7IE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=kDCGVrXLwTEJIJCbMru+NRWn/3+byUjwMxFTQeeX6qOQ0AWPUodWTROouuTp8Kcp2V0/qx1kj0Q43S49ixL7W5SyhhjiFHMjwBwj6264xxhfW7QsMfnB8lMU7eBvw+QxjBZ0b0Xvv0l40F2jLmh+jCRdvzbjw9PRBgQkkiQtl2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etTg8LHT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etTg8LHT"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bcd0111ea98so1447897966b.1
        for <regressions@lists.linux.dev>; Tue, 26 May 2026 03:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779792016; x=1780396816; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqXUGLpT1dA9YMKXdh8DEtG5timDuzzlcnIySkvCiMY=;
        b=etTg8LHTh024it8fBPG8+3oq7Tn4RywPqFAmgeNnI88Y/7/4Yy0wxOuvr2H0Igedh/
         n+h34S5a37vdsV6O1+a48nEhIX+tqJrOQkxaBxXvSi6rJix7GwqgF3chseOm3UD5u30H
         0so54EPnCOqNqMaoyHgILQDEQgUxQfY+ifFHbSWWnA6Mde7RwcUYbpPh+cyoLxNAW2B9
         +sGt8e3DMGB43Dqt56zTHro/8+E+z8Qri7ehuccWtRbn6w0NpRzLhPRz5LZtrD3ax9wc
         eSKERFbICDBNB/XjasdU8gP5RFtuz+HN4UFf/MuHrjceFbyoankiJ+AtwmBcXy5bJspd
         peIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792016; x=1780396816;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqXUGLpT1dA9YMKXdh8DEtG5timDuzzlcnIySkvCiMY=;
        b=l+1F2FSB5OG7MMY4s0HNPez8CFp8cRGychCnNaoO4HHaRkq7PPPbAms5iLRvr/j5W8
         Pl2MJ/ORxhjixapcmXaY1fQTngDl8gfXz5ORYLzFk3B0Pm9XPJ4tjFyOdqgF5lcQnGMh
         dQ5qYlTyKFQRCXiLdnXVm3L1mZeiEaxnqBMXeb1fRKHjDeogzez2L2YdiMBRkJiw3+tX
         y3JS7Uiil+W5T2gTpzF0IdLyNJ6US//AEFwMAwvcYWeMrJtGBvityKZ0RVlb5KS533Qb
         BG/gclhyuvsOJFXwMQ9zgWOrqBviXFA9ny7O2eXTTDNd3WYFwGn+7Xg5D4HX5K56Xfli
         CmKA==
X-Gm-Message-State: AOJu0YypTeNqwwKpRggaxHLMUgMsMCvBTNuITxxkAEhUBNtSRl4jgozM
	kurwSAJTCgLCyp3UbakETNyVLA1xuUxg+Cnq6nTBMtqDhp2msndf0xKl
X-Gm-Gg: Acq92OEX27SGCesgo3gQgAew8FbPEkqDRZBvdF6pP61KOYxCGpTnO9kQhZiVhKN2m8x
	UMYuXCS9T2ZXCEguYewwEVuodh5qIrMjyBwTRWpW4ZuwYjqzJbCiC/1bSR0cMWBsI4I/t+DHsK7
	3UTRpvupP7LH2HLQr/WFreAdcYsQYurSOMsR3tNWamAOAbJuUJt8bhyJqgiHiFWF+GR0YrqYUqA
	w7rrgxvBZFkCRJTsixWb2OEGLO9OzS/69j2UtYaBsQhV/aLdu1KEeb0ohUC2J5EI3ODrzzfnglA
	OUlKfajBStQsyu3767C7CUFjLhL9LC/AKUgn4qTBBoff5m4vzwdjrgmWIj2J6oBCGC4orZ6/Dzi
	h52q1eepU4veQFxQysWGqkl920z53WvOQ7WmvwsYNsBEzEyUAX8L8uAnvkhSzquq/dL6Cg1kTHu
	D1lCPOjlqI2x/+yMDAR1OA+7goRiQ=
X-Received: by 2002:a17:906:8a64:b0:bda:916b:c87e with SMTP id a640c23a62f3a-bdd28b6f18emr790400566b.12.1779792015569;
        Tue, 26 May 2026 03:40:15 -0700 (PDT)
Received: from [192.168.7.128] ([80.242.35.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb139b40sm4764655a12.24.2026.05.26.03.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 03:40:15 -0700 (PDT)
Message-ID: <d02905f7-6ef8-4df0-bb55-dea44fda6ce2@gmail.com>
Date: Tue, 26 May 2026 12:40:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, willy@infradead.org, brauner@kernel.org
From: Oleg Chaun <olegchaun@gmail.com>
Subject: Subject:[REGRESSION] fs/qnx6: incorrect pointer arithmetic breaks dir
 scanning completely
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


#regzbot introduced: b2aa615

Hello,

A change to fs/qnx6/dir.c:qnx6_readdir() introduced in commit b2aa615 
contains an incorrect pointer arithmetic (adding an offset expressed in 
QNX6_DIR_ENTRY_SIZE units to a plain char * pointer) which breaks QNX6 
directory reading completely: only few entries are visible, kernel log 
is spammed with "invalid direntry size" messages.

The following patch seems to fix the issue:

--- /tmp/temp/linux-6.17/fs/qnx6/dir.c    2025-09-28 23:39:22.000000000 
+0200
+++ ./dir.c    2026-02-13 18:52:56.000000000 +0100
@@ -138,8 +138,8 @@
              ctx->pos = (n + 1) << PAGE_SHIFT;
              return PTR_ERR(kaddr);
          }
-        de = (struct qnx6_dir_entry *)(kaddr + offset);
-        limit = kaddr + last_entry(inode, n);
+        de = ((struct qnx6_dir_entry *)kaddr) + offset;
+        limit = kaddr + last_entry(inode, n) * QNX6_DIR_ENTRY_SIZE;
          for (; (char *)de < limit; de++, ctx->pos += 
QNX6_DIR_ENTRY_SIZE) {
              int size = de->de_size;
              u32 no_inode = fs32_to_cpu(sbi, de->de_inode);

I can test any further changes on real QNX6 fs images if necessary.

BR,
Oleg
