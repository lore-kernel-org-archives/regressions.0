Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360A8303C85
	for <regressions@lists.linux.dev>; Fri,  7 Nov 2025 20:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546356; cv=none; b=F5MxwN8a4jr25/z85HiSrIAjLTQZ579egTqsVsPpLqImbiccOr7+9D3gqPX+PYWHmr71Q+06XdNMK292Rdb93pZyOkEDutsvQ8XdbCOBuePmPa6q15bCQb+5Ojq0SlDAoajmSyMZyI6Ds4v7cVy+cNFc114HycYulw0cJR+sQjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546356; c=relaxed/simple;
	bh=xhuY738tZl353Xy0fNRI/QG1yk1TSCZTX05qyNUVL30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B+FbFJ7qH7XiAwBSf9QrNB6Y/t/Z7JAr+tmp6XzcjfzmATAhf8VSWPQ64E+pbJlVulsJMQvzyKv+WaygO1/P6MSBoOMf303MuZMWrWatf31U48CNnnLrljbtCwfgW62Zsmg4NQOfdYGBupfmS/DYbVhl8slF9D3c+YD2cVB7Pwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=eSNQ7ct1; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="eSNQ7ct1"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b0f54370ecso122329385a.2
        for <regressions@lists.linux.dev>; Fri, 07 Nov 2025 12:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1762546353; x=1763151153; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPIKY3pDWsZYiW/KD6AWR+JZdgeQXYTbfkJenmEgskU=;
        b=eSNQ7ct1yiLNQcVemcYHqvuYPsKQg0YtNw35TnmUy/PvczBiT7YPF8iUsgzdOB4bW6
         SxCuYW4AuIW0/k9Fl1cDJxiljlqkKCgTGGV7AZxMgTuiDICNpee0AFGaPNOubRcjQ4YZ
         C0W/WHhQMnWGgROTnOUI0rJhCyLpqzIYL4QIH2nMoOKq82L0f0tJTLGhgLYfGHb8srsc
         1KLzVf0/+DWeGZaWCfjhTCIqYjLLbcU0PSgrB2bN3nnTTJh0wwl5GviFD1+grxsnCf2y
         hH1+4grKeKHiyjrftKWsie3dsT9TQy51970OXjDZr9rEPkPi2n2NasY4X5YWhQ2VzYyG
         YVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762546353; x=1763151153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPIKY3pDWsZYiW/KD6AWR+JZdgeQXYTbfkJenmEgskU=;
        b=gxY/7ZeMcvQwaUOLtEFMsm2LA+MT7bZ8uBI6DMJXh6cC+JXiquxJiB6gCa1XsVe/dk
         LeheXDhV+fYq92/RvEbu3SNpBIS3Etan3Dz6CDDuFZMpsiF23EigGzzlwdR+76tVX2mY
         unJzE1GBXDRLzzZk3eXCVnlw39pLwUwxwl/fBEcFbDHzY7ZRIK1Gqj42YiBSaRgAjt34
         /NTH3GoCtZV1JhFyQw+c2iUzqWP3ToriUvs3TK4X095Lxxk61/04yUf2gDgMA4VQCbM1
         vQRkkBaJlw3/5ynf7JFXl+gKhCBELySo7cQzaTsq8vgUP8e1vhwWwCyc/Z2nERkzBNST
         QUew==
X-Forwarded-Encrypted: i=1; AJvYcCWH00zGfYZQy9TyLIdAWAxtIx+DjMhqkdvpjErexKX7/XhZNVF6rUlnyphVxt/l3W8aLnEdUehyA+Nf8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUTsfy5ZsnheLZD0Cykc6xSmxozQni+hTxTeL+uWAatJdrCIqO
	EuLfx5ZiNXYOhlr5rlWbtLlMIf19chRZyjVuE3tT3GO54nAL2/wbmoNp8mBw8NBDRMA=
X-Gm-Gg: ASbGncvX3mGcLFfZUhIC+rmpLuBKKBcT0vfEbdFPzRHuoSorKDRff2nPR7CdsNXKuZP
	ez+acuRTXWTtSc/FMU5NQPa3AIiMYjKSP83psqUTflGcDCu0cXuEghGZuunlPzpG50y21DzrCuD
	t2sCHaDvyyOxCPDlxVKiWp1avnd3k9oIC8rUOHDN5f3tDGOYnE8eRUyvBZ61Kvt+MmLqaSoCfu8
	tipIxNQExddEIHG9yi6luTw7II/9tDGZNvEmXva3xH9vq86T04Bof37b6AwETgBbt5ZjAU75kZP
	ltVWf+82rVEXTZxdRbfA5zK3Rq9obabzRdwSOh2Yrv/eyrYPFy+A7ZeWeiuasCit2FUF5UdNuz8
	ql8nzn84lvomukU+ummMQRyO/Co1rCbwsrqS55nIshTUBVxH3t+9YMNA+vH+UpqsJ3F2kScBK5h
	KWKsRCGA2nYNaDpMSpZhUjk/AoUQGtIg==
X-Google-Smtp-Source: AGHT+IFsLLiomLTVAKf0UK7Kqv+I/lwIiIqePUIuZ3D8VSGGRtsZSWpNNzYLl1SSmqIrjJUQd1Y7Lg==
X-Received: by 2002:a05:620a:44ce:b0:8b2:33bd:7331 with SMTP id af79cd13be357-8b257f68729mr69675385a.83.1762546353068;
        Fri, 07 Nov 2025 12:12:33 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-8b2355e9bb6sm476602085a.22.2025.11.07.12.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 12:12:32 -0800 (PST)
Date: Fri, 7 Nov 2025 15:12:31 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: PROBLEM: boot hang on Indy R4400SC (regression)
Message-ID: <ea6p4efuwbrlqjiwkgjcd7ofj7aahfnnvnkooo2il36ggzrlcj@n6mcofpb2jep>
References: <g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu>
 <e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com>

On Fri, Nov 07, 2025 at 07:29:25PM +0000, Jiaxun Yang wrote:
> Unfortunately my Indy won't go over ARCS prom so I'm not in a position
> to debug this on my side. I have inspected the code again and I can't
> see anything preventing it to work on R4000 family.

I'll try adding some extra prints to at least figure out where it is
actually hanging.

Thanks,
  Nick
