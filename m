Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE70315AF5
	for <regressions@lists.linux.dev>; Sat, 28 Oct 2023 15:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7788f727dd7so221591485a.1
        for <regressions@lists.linux.dev>; Sat, 28 Oct 2023 08:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698506064; x=1699110864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edrT3wG/vlC5yAs6mr/X68CLECTGUmsWaJYhfyzukiY=;
        b=D0HY2vNoGX8Nztp2bHk4QKTZZL4exbw1fPue6LIBOKkSnCsbSPRnEP33L02Qt2aIr0
         u4lQBvPHYr/spDP2R924TU8sbTa4JtBbUl++smxAAgA9GRPfIjF+EI7dFSrzLlHmSaN4
         k7ABo0AXOizPjs+z8eS5q8Yaz++BpATs36oDsY6DZuz4Y/PIHqz+BQBVfsK+3J0CLM6n
         5Qnjd151QLFFByhwYXK2USqO9hFzz3rtloQj7FQLPbMOKC5z20tqEPsx8BTZcDVhlwZ0
         FpA75ZFtDdeZqxrg0jbWe81VuH7M+ImdKyYCWh534jt1GiWRR89AeAjl/dD+iLUV9kL6
         huSw==
X-Gm-Message-State: AOJu0YzeHlFaureGDuCeTYPwq/LeZkckS8VETsZ6LoL9k4HRDAEgxIQB
	lUA/UFoNWMm1NSPR/Mz8ktc6
X-Google-Smtp-Source: AGHT+IFz3FFwOBGqOtVkA6xb2pksB7Wfy6+96bwsBbKM6DOuPkOrQvrErGnF7d2hQ1ocgDx6K+nVWA==
X-Received: by 2002:a05:620a:45a3:b0:774:3235:4e6d with SMTP id bp35-20020a05620a45a300b0077432354e6dmr6608509qkb.21.1698506064506;
        Sat, 28 Oct 2023 08:14:24 -0700 (PDT)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net. [68.160.141.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a05620a14a400b00775bb02893esm1617261qkj.96.2023.10.28.08.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 08:14:24 -0700 (PDT)
Date: Sat, 28 Oct 2023 11:14:22 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	stable@vger.kernel.org, regressions@lists.linux.dev,
	Alasdair Kergon <agk@redhat.com>, dm-devel@lists.linux.dev,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: Intermittent storage (dm-crypt?) freeze - regression 6.4->6.5
Message-ID: <ZT0lTposMdp/++IS@redhat.com>
References: <ZTNH0qtmint/zLJZ@mail-itl>
 <e427823c-e869-86a2-3549-61b3fdf29537@redhat.com>
 <ZTiHQDY54E7WAld+@mail-itl>
 <ZTiJ3CO8w0jauOzW@mail-itl>
 <a413efbf-7194-95ff-562b-f2eb766ca5c1@redhat.com>
 <34f6678e-6460-f77-73f4-fc8d3652a8e5@redhat.com>
 <ZTzTBUdaX1h8ivZZ@casper.infradead.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTzTBUdaX1h8ivZZ@casper.infradead.org>

On Sat, Oct 28 2023 at  5:23P -0400,
Matthew Wilcox <willy@infradead.org> wrote:

> On Fri, Oct 27, 2023 at 07:32:54PM +0200, Mikulas Patocka wrote:
> > So, we got no reponse from the MM maintainers. Marek - please try this 
> 
> yes, how dare i go on holiday.  i'll look at this when i'm back.
> probably.

There was no malice or disrespect until you emerged from holiday.
Hopefully you're at the start, if not you should extend it. Probably.

I've staged this workaround until you or others can look closer:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-6.7&id=b3d87b87017d50cab1ea49fc6810c74584e00027
