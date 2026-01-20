Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8473F075B;
	Tue, 20 Jan 2026 19:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939089; cv=none; b=Edh8+2C9Mo/12IKRAdc0/kcZRyaU28qxW6Hz8pbftfU6QqtBPliaASAOFuPs5KqgKkJDrALzVXeadH24I3iiCCcZYoDLZKYnFV8wlvUbgiAuW2dRCYPwAxyp2rcY9f7CasI4uh740v0BI5yQOsretLFStGoPhEihS/QXiB1O9b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939089; c=relaxed/simple;
	bh=hZmi7FUmOLLCUzcmdgSc4GPitbdEXI0bs8jzSO+NZkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWmrokR38p9GAkeI7cpQ6N5C1zEKGEiXf5wBnIkh4zHBQj5QVDhNEGv7AHKw19dhcmvmxzvPAtg2ihZkwd2jGMEimXZjvFLN0xt8BdN7ZGDnQrcyPhF9/pGfvtb3mFY/OgimgBhSpmi/qeo2lN0jIhDOhRd5mfmk8UsMZFJvGJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHjp/G5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHjp/G5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA77DC16AAE;
	Tue, 20 Jan 2026 19:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768939088;
	bh=hZmi7FUmOLLCUzcmdgSc4GPitbdEXI0bs8jzSO+NZkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oHjp/G5ElsXPIpR0BFxkkCtJYbEZj2D9Djqbr9mhkJamUesL1E7y39Ob561hdb/LO
	 KvMSE6/+iCNEuVMfZuD3wpCp5bFLWouIwvyFBilwFb+xYNbxLNDu40R9um4LBw79h5
	 j8g84CwFIyLKkp1Na+ghMYO9xSVfBERtiV7mZfy37kNwc3krwQk++a+E5dq2nuE2qf
	 o+nvV0sWey9TgRMwotPes5YqydkShh2kc9Ofn0wLbHanyYi3325efh1sxo9x84Bkxt
	 4nP+dZJrPp3ZqbPpRCxLLhOm0CzHSnOM+0PSU4cpfhgPhnpLjPf9bQs3VUFyLUOC84
	 hWOSUH9HFjUXw==
Date: Tue, 20 Jan 2026 14:58:06 -0500
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
Message-ID: <aW_eTgksTr1P2Gh1@laps>
References: <CAJZ5v0gkhSxWZ9wTY+2AGDCtZgSKmOwpg7Np9OVDMJptqnntUQ@mail.gmail.com>
 <20260120102832.GJ1890602@noisy.programming.kicks-ass.net>
 <aW--GBGlZ6FH2m8P@laps>
 <CAJZ5v0i6Uw0+L5SY3QW+py82uEVktNWcHGHf=Za96mQpN7X8Bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0i6Uw0+L5SY3QW+py82uEVktNWcHGHf=Za96mQpN7X8Bw@mail.gmail.com>

On Tue, Jan 20, 2026 at 07:29:58PM +0100, Rafael J. Wysocki wrote:
>On Tue, Jan 20, 2026 at 6:40 PM Sasha Levin <sashal@kernel.org> wrote:
>>
>> On Tue, Jan 20, 2026 at 11:28:32AM +0100, Peter Zijlstra wrote:
>> >On Mon, Jan 19, 2026 at 09:19:31PM +0100, Rafael J. Wysocki wrote:
>> >> Hi Sasha,
>> >>
>> >> Commit 436326bc525d ("objtool: fix build failure due to missing
>> >> libopcodes check") breaks kernel build for me.
>> >>
>> >> Here's what I get when I try to build the kernel after that commit:
>> >>
>> >>   LD      /scratch/rafael/work/build/xps13/tools/objtool/objtool-in.o
>> >>   LINK    /scratch/rafael/work/build/xps13/tools/objtool/objtool
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> in function `print_operands':
>> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3945:(.text+0x6317):
>> >> undefined reference to `xmalloc'
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:3992:(.text+0x6723):
>> >> undefined reference to `_sch_istable'
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> in function `print_insn_aarch64':
>> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:4559:(.text+0x6b1e):
>> >> undefined reference to `bfd_get_bits'
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-dis.o):
>> >> in function `parse_aarch64_dis_option':
>> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-dis.c:103:(.text+0x6dea):
>> >> undefined reference to `_bfd_error_handler'
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(aarch64-opc.o):
>> >> in function `init_insn_sequence':
>> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/aarch64-opc.c:5561:(.text+0x5c06):
>> >> undefined reference to `xcalloc'
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../x86_64-suse-linux/bin/ld:
>> >> /usr/lib64/gcc/x86_64-suse-linux/15/../../../../lib64/libopcodes.a(disassemble.o):
>> >> in function `remove_whitespace_and_extra_commas':
>> >> /home/abuild/rpmbuild/BUILD/binutils-2.45/build-dir/opcodes/../../opcodes/disassemble.c:801:(.text+0x346):
>> >> undefined reference to `_sch_istable'
>> >> ...
>> >>
>> >> (many more similar messages skipped).
>> >>
>> >> Reverting commit 436326bc525d makes the problem go away.
>>
>> Thanks for the report Rafael!
>>
>> Could you confirm that you're linking against static libraries? I haven't
>> tested that scenario.
>
>How do I check that?

What do you get running the below?

   ls /usr/lib/*/libopcodes*


-- 
Thanks,
Sasha
