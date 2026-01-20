Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBC933D6D2;
	Tue, 20 Jan 2026 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768940543; cv=none; b=E7Wrdya/6qvK43zq5gJYrXUIXt6UeACpJsjVi+LFxihS3HGEpsMlNWuqeuwbBysmtL6fjJ2XYsFDXObIkcv4XCKtQiFOdSAw+aZ0TQ60BRucOyM7UpSJRPCtMlUexdaEcQ0U4Y76s7cyhf3mZp3HGL9UxT/fZ1jzlbd66fhZMA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768940543; c=relaxed/simple;
	bh=5IzahNWydNwQtsKEKAQ5QnxTQtuBvgT2vfW6oL/CkNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K89USCr0sYZhMDT9r1015jqWhBI9/htQ+U67T/4zI1AjgTedF47zJsv8D617jW9lleDYCWEhTWF3MWmCM6dKn6yhSsMYGsarROKEWtefWIlnM90YlTkn3WLbf/XSa4HRrTJWxWPw+ji7pgtsg/OzxzvHE2nRrUapur4OEqlG7sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnWDCrYI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnWDCrYI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67AEC16AAE;
	Tue, 20 Jan 2026 20:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768940543;
	bh=5IzahNWydNwQtsKEKAQ5QnxTQtuBvgT2vfW6oL/CkNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnWDCrYI4SuEyrQDzIKANbqsZ1I7qNAHr6eGf+tf0PuMZfWagEYAwTqSW6Itt58La
	 SksTccCc5VDOi5rcPArjCqkUjgF7ck7Lwy/EmSFFGaOH2hkkUZp0XEdBlZ97nvM0Ij
	 PiBKZVS3jFqDrSB2mXwVhzT6LsRTi2uX0aJzlcbMnK6q+cE8vnjnjMVHw8lIMNpBzW
	 WdeEPkhGq54W7VJoKIt6j8cT151dL/Jlhol+ZKq2WBaWAvkkJmiLKrT/CrbCY12hnn
	 laIKQuSD9Qu56ugQueEPwEaSXJnf7rvQ5cYnBeu60KWQsKKObH2Y7F/2Vy+bzuVvfw
	 Sfu0R9Qin78Kg==
Date: Tue, 20 Jan 2026 15:22:21 -0500
From: Sasha Levin <sashal@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	irogers@google.com
Subject: Re: [Regression in 6.19-rc6] Build breakage after commit 436326bc525d
Message-ID: <aW_j_aqyipRqtupO@laps>
References: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
 <20260120102832.GJ1890602@noisy.programming.kicks-ass.net>
 <aW--GBGlZ6FH2m8P@laps>
 <CAJZ5v0i6Uw0+L5SY3QW+py82uEVktNWcHGHf=Za96mQpN7X8Bw@mail.gmail.com>
 <aW_eTgksTr1P2Gh1@laps>
 <CAJZ5v0g2S9_nCxmO=3pc24ESQ=qSFRWoZwfDw4W6hkXc3uo3qQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0g2S9_nCxmO=3pc24ESQ=qSFRWoZwfDw4W6hkXc3uo3qQ@mail.gmail.com>

On Tue, Jan 20, 2026 at 09:04:25PM +0100, Rafael J. Wysocki wrote:
>On Tue, Jan 20, 2026 at 8:58 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> On Tue, Jan 20, 2026 at 07:29:58PM +0100, Rafael J. Wysocki wrote:
>> >On Tue, Jan 20, 2026 at 6:40 PM Sasha Levin <sashal@kernel.org> wrote:
>> >>
>> >> On Tue, Jan 20, 2026 at 11:28:32AM +0100, Peter Zijlstra wrote:
>> >> >On Mon, Jan 19, 2026 at 09:19:31PM +0100, Rafael J. Wysocki wrote:
>> >> >> Hi Sasha,
>> >> >>
>> >> >> Commit 436326bc525d ("objtool: fix build failure due to missing
>> >> >> libopcodes check") breaks kernel build for me.
>> >> >>
>> >> >> Here's what I get when I try to build the kernel after that commit:
>> >> >>
>> >> >>   LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool-in.o
>> >> >>   LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> >> in function `print_operands':
>> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3945:(.text+0x6317):
>> >> >> undefined reference to `xmalloc'
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3992:(.text+0x6723):
>> >> >> undefined reference to `_sch_istable'
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> >> in function `print_insn_aarch64':
>> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:4559:(.text+0x6b1e):
>> >> >> undefined reference to `bfd_get_bits'
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> >> in function `parse_aarch64_dis_option':
>> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:103:(.text+0x6dea):
>> >> >> undefined reference to `_bfd_error_handler'
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-opc.o):
>> >> >> in function `init_insn_sequence':
>> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-opc.c:5561:(.text+0x5c06):
>> >> >> undefined reference to `xcalloc'
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(disassemble.o):
>> >> >> in function `remove_whitespace_and_extra_commas':
>> >> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/disassemble.c:801:(.text+0x346):
>> >> >> undefined reference to `_sch_istable'
>> >> >> ...
>> >> >>
>> >> >> (many more similar messages skipped).
>> >> >>
>> >> >> Reverting commit 436326bc525d makes the problem go away.
>> >>
>> >> Thanks for the report Rafael!
>> >>
>> >> Could you confirm that you're linking against static libraries? I haven't
>> >> tested that scenario.
>> >
>> >How do I check that?
>>
>> What do you get running the below?
>>
>>    ls /usr/lib/*/libopcodes*
>
>"No such file or directory"
>
>However,
>
>> ls /usr/lib64/libopcodes*
>/usr/lib64/libopcodes-2.45.0.20251103-150100757.so  /usr/lib64/libopcodes.a

The linker looks for libopcodes.so (not the versioned .so). Without that
symlink, it falls back to libopcodes.a. So yes, looks like you're using static
linking.

To confirm, can you try to:

   sudo ln -s libopcodes-2.45.0.20251103-150100757.so /usr/lib64/libopcodes.so

Any then running the build again?

-- 
Thanks,
Sasha
