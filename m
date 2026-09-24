Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70EC3A5E67;
	Thu, 24 Sep 2026 08:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790240389; cv=none; b=MROg1Q3h6DcdmdmXpS0TfbOKTRl0zlDcpseja+icj43dE1t58pbaKxYZ9XFeUbnmsN4zV+WA/ZKc03+s98RLypHY8/jFjL8WmXEQZ4A50EoreyhvYH+ET7shK1fl/Beb/cWpiadZMNIHYUK7WoWwO4HYTlBQ0ULooKH8AdzgySk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790240389; c=relaxed/simple;
	bh=Io5KPs3+e9rF9aHwE+Ksi7DWXYr1YbqvRxUzBd1MYhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv6zQuTsRtgj8ikWVn015Z928ccIwuUGDQNLY4nNM9IAlBKqhPTNhYqVGmqBlY9vWtQmxEyMU5zauDl8KyqUfXLjS3mKEGCaMJ1fWFJq/C/ml20wgn2G88qsc5fWI8MrKG5nCHpAZfGTuW5YEH81I5cnwz+FtqHmlBMI8lO4vWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXZd67K9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXZd67K9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E35F1F000FF;
	Thu, 24 Sep 2026 08:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790240383;
	bh=fj1ZPwdDvX+UjsWWWJMAQvWXngknkta8Wq/rzff/2vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RXZd67K9zWwIcZ0O5/CuMnTCOvAPvJXqpijri2umAWD17aZ1yScJgoFNqP1eFwwbt
	 4Y2ZA628CzFjMpQbTMetH1X47CsR6HrOR8xSOWH5fFvTSMe+60PyX0LRoepeKvhA1A
	 fLksoJUgG2MmnzXe3jdAP5GyrJI4sdtb0COiDr1B195IA6+UvtUSr7Q52qevbfCkfI
	 nDoeemuecX3yYvH9KnDZBRT5OF6pf0msb6zG/SEjVFaBiPc0dn5zIB63Otz1Ql9tPA
	 drdNDAHFq8iEFgaL0BGYcPVwKxPs75kATjDuuGSLCcAaShFe32C+hy1CvaTVXj8pvn
	 kznHZdkcUuDlg==
Date: Thu, 24 Sep 2026 09:59:36 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Vishal Moola <vishal.moola@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Steven Rostedt <rostedt@goodmis.org>, x86@kernel.org, 
	linux-mm@kvack.org, regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: don't defer freeing kernel page tables while booting
Message-ID: <arTmLiTLnxhwohH1@gremlin>
References: <41a59ba9-039e-454f-8d31-f647db802ada@kernel.org>
 <20260924072819.33277-1-mikhail.v.gavrilov@gmail.com>
 <65b94694-d503-46c5-9f13-f0f7f8bba8d8@kernel.org>
 <arTl5Cc1B-2_BoHP@gremlin>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arTl5Cc1B-2_BoHP@gremlin>

On Thu, Sep 24, 2026 at 09:57:57AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Sep 24, 2026 at 09:31:40AM +0200, David Hildenbrand (Arm) wrote:
> > On 9/24/26 09:28, Mikhail Gavrilov wrote:
> > > On 9/24/26 09:07, David Hildenbrand (Arm) wrote:
> > >> Should we instead simply skip the
> > >>
> > >> 	schedule_work(&kernel_pgtable_work.work);
> > >>
> > >> and rely on anybody freeing stuff later to just free that one alongside?
> > >>
> > >> That avoids throwing in more freeing handling.
> > >
> > > Yes, that is simpler, and the early table then goes through the same
> > > IOMMU flush as every other one, so there is no need to reason about
> > > what an IOMMU can see during boot.  The only cost is that it waits on
> > > the list until the next kernel page table is freed after boot.
> >
> > If we're worried about that actually causing problems we could drain the list at
> > a later part during the boot stage. I'd suspect we free something else later
> > already and simply drain the list ...

And on that, yes, I don't think there's anything to worry about there.

--
Cheers, Lorenzo
