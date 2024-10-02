Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6E61E6DD4
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 11:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868342; cv=none; b=oyES59cbzif1PqrRo5Ni2L8VzKa7TdK9ph0rwdzcuiOUayOE1aQJjie8sfcRJDGgoIziVyLqXTE0ENgxXhphIE5sE3HHXm63cXsbbXKv4OoMjXcg02JfwjuhdoD+4iRMOO8QqcASaguHHBVdY2hjEHLCeFMThLxmMjMZbQTnaPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868342; c=relaxed/simple;
	bh=+ji33y/UBdQo/trFXUgL/SbYVLsbILvrrYA7MxlKHsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dxcjZj+zzAul+FqlZ24IlprM1XqfKXW0lizbPywqlnkUYOM+JDlaLihEkD1n2uhwRfwsRGnt03FyoR9DnPtTtc55NueLfFIVNRgCJy6IICikA93/g9YWmg1aOuoZIHAYMcKaEaUPZLecQxxueZDSRGvcKngoENV+ZrgMgdUYMz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4+L+zHo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4+L+zHo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37cc60c9838so437755f8f.1
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 04:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727868339; x=1728473139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh/Ib6nbjDZdX/dSTD6KdOyTsxvhc9sc4GJADx2Wx10=;
        b=H4+L+zHopJSAc/AHE+n2dTJdgvGhIW7oboG2NGLY5aMC9Or0euCHl+DAstxBt2azRq
         jgn+vtCjFzLP6PgOMM78ydBqBeF0kG+mNn7zaI7ZEffcSPrXBdOqhFzVc//LoOXOrMpU
         5c2T1LN5JTvUtOyS2hYiH8hHd2SL+9x2yhBlKH1DePkQOrwRGbrVpSQrElmMArH3coi8
         nmTCn2/5icXA70N7gm4t9ip0HdnMOPJgxu0+/ZVdFJYpUsAy0esY76Yyn8X8czK9oEvS
         UkDZgix3yvLl19vpTQmlaMvWe/nUU+GiCHKu9Zz0QLNgY7RD+7XCdfRFUqD7os1Gv+0T
         NTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868339; x=1728473139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh/Ib6nbjDZdX/dSTD6KdOyTsxvhc9sc4GJADx2Wx10=;
        b=YEG8Zbo/+T3lB46x/497UHvrowyiXLwiAKHSrv2uoTlytSeKzAm/7Ep6KnFngcKgfj
         9OUa7YTLg18Z/DYxNWJnXXpwTe01zV+3JjWc12Qb6kOBzFpSZWkd+aE9t47UN5RPD9CI
         RpLVhdnBTUmVTP5fck/3rkv3nWjB/O/lZYA+8OtD2VuB8fjTvL8Gv1vn8ECnSHSVqdqQ
         OQpfAXvWoK+s6RF/owhpT+bWvXxtz8goyPDJT7QZuXDIq4HfFuKyxShFD7ItD/fsTY2v
         12HPdGpAT8vhGtuvbObs850VIinY0y2HA88528EeA6dgpJnMCE9/uk2mKuUYlbtra66R
         XmbA==
X-Forwarded-Encrypted: i=1; AJvYcCV1tprwHDGRzOYS7ADv7r+KkBEB3JwpQUKDX+gCydtG+X/a6PSuZbx9S/8O74V9Y1ENgeQxykc7rKKFzw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxaq4Y60pByj5F5J9N8Nu8J00zHb62AUTkeBmZN2MirxySZPAwp
	c8mL7RvmUewIjIUaslcSIzQtlDrCp9cOdwRP2LetEB3TNZL7oNFs2sw8DhxhtF6VjhizhbKp1Fh
	A
X-Google-Smtp-Source: AGHT+IGHSAfjhltaRCpdcuYThLNf3RBIpXaHC0k14SaD4k7m6OtQWT5Y8bq23oOSq9qN+wlcJZFodw==
X-Received: by 2002:a5d:59ac:0:b0:374:badf:3017 with SMTP id ffacd0b85a97d-37cfba36371mr1270807f8f.33.1727868339227;
        Wed, 02 Oct 2024 04:25:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cfe30a3b4sm1145917f8f.13.2024.10.02.04.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:25:38 -0700 (PDT)
Date: Wed, 2 Oct 2024 14:25:34 +0300
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
Message-ID: <b22dbfe2-dd29-40de-a4a3-4a0d6b55cd65@stanley.mountain>
References: <CA+G9fYvo5npQ3o_vgiOX2guHtgafRoFPL__4O8Kcwg2=ssXmKg@mail.gmail.com>
 <e718bc99-e63b-4adb-9e40-2379f48301f5@stanley.mountain>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e718bc99-e63b-4adb-9e40-2379f48301f5@stanley.mountain>

On Wed, Oct 02, 2024 at 02:24:20PM +0300, Dan Carpenter wrote:
> Let's add Kairui Song to the  CC list.
> 
> One simple thing is that we should add a READ_ONCE() to the comparison.  Naresh,
> could you test the attached diff?  I don't know that it will fix it but it's
> worth checking the easy stuff first.
> 

Actually that's not right.  Let me write a different patch.

regards,
dan carpenter

