Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BED37D
	for <regressions@lists.linux.dev>; Tue, 11 Jul 2023 14:42:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E15C433C8;
	Tue, 11 Jul 2023 14:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689086521;
	bh=MdxCExtG1yS5jseJzhYZubJ18kck0OwZ+QV+A9naVKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1PABcnU24Ywv+A1RIENK8p3TeyiKe/iVroyJMvpggIJp5J9YHPZFZb79dEBpNU2U
	 kQ2P1OKeqvnPHJjT/HYtKNEGMGmCCJtycWVETjBGz37mf3hQtz0qUqZ3kQrHcX0yVk
	 8QiasGvR3D+gxYtaAtlVbHp7ggPNKTSOxYE35350xQCoLcKTDT4vJawKuvWv/WaHOJ
	 KkG+T+SKPXFwskQXV2MA1kXZrBKvWZtIoMtN7fr4xdJPINq9c2VgdoNof1Jud4IPLf
	 OvgUp1kyTdqH3VRR6Vnf1WCoPJ0cB+xibQ2uLhqExOO9OV0NBuxfUaNZIqz8Y5EV6W
	 Uj8GQTQWOo/5w==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id D1FC640516; Tue, 11 Jul 2023 11:41:58 -0300 (-03)
Date: Tue, 11 Jul 2023 11:41:58 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Georg =?iso-8859-1?Q?M=FCller?= <georgmueller@gmx.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	regressions@lists.linux.dev,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf probe: read DWARF files from the correct CU
Message-ID: <ZK1qNnmdYOWLiN4H@kernel.org>
References: <5a00d5a5-7be7-ef8a-4044-9a16249fff25@gmx.net>
 <20230615200147.664346-3-georgmueller@gmx.net>
 <ZK1RyVue7OMXzVl4@kernel.org>
 <20230711222000.d316cf7fd643cb4203ea1204@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230711222000.d316cf7fd643cb4203ea1204@kernel.org>
X-Url: http://acmel.wordpress.com

Em Tue, Jul 11, 2023 at 10:20:00PM +0900, Masami Hiramatsu escreveu:
> On Tue, 11 Jul 2023 09:57:45 -0300 Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> > Em Thu, Jun 15, 2023 at 10:01:37PM +0200, Georg Müller escreveu:
> > > The problem is that die_get_decl_file() uses the wrong CU to search for
> > > the file. elfutils commit e1db5cdc9f has some good explanation for this:
> > > 
> > >     dwarf_decl_file uses dwarf_attr_integrate to get the DW_AT_decl_file
> > >     attribute. This means the attribute might come from a different DIE
> > >     in a different CU. If so, we need to use the CU associated with the
> > >     attribute, not the original DIE, to resolve the file name.
> > > 
> > > This patch uses the same source of information as elfutils: use attribute
> > > DW_AT_decl_file and use this CU to search for the file.
> > 
> > Thanks, applied to the perf-tools branch, that will be submitted for
> > Linux v6.5.
 
> Thanks Arnaldo and Georg,
 
> It sounds perfect reason why that happened. I didn't expect the case that
> the attribute comes from another CU...
 
> Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
 
Thanks, added it to the cset.

- Arnaldo
